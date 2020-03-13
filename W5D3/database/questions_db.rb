require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :lname, :fname

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        users 
      WHERE 
        id = ?
    SQL
    return nil if user.empty?
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil if user.empty?
    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname'] 
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(id)
  end

end

class Question
  attr_reader :user_id, :id
  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        questions 
      WHERE 
        id = ?
    SQL
    return nil if question.empty?
    Question.new(question.first)
  end

  def self.find_by_author_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil if questions.empty?
    questions.map {|question| Question.new(question)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author 
    User.find_by_id(user_id)
  end

  def replies 
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollows.followers_for_question_id(id)
  end
end


class QuestionFollows
  attr_reader :question_id, :user_id

  def self.find_by_id(id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_follows
      WHERE 
        id = ?
    SQL
    return nil if question_follows.empty?
    QuestionFollows.new(question_follows.first)
  end

  def self.followers_for_question_id(question_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        id, fname, lname
      FROM
        users
      JOIN
        question_follows
        ON users.id = question_follows.user_id
      WHERE
        question_follows.question_id = ?
    SQL
    return nil if users.empty?
    users.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        id, title, body, questions.user_id
      FROM
        questions
      JOIN
        question_follows
        ON questions.id = question_follows.question_id
      WHERE
        question_follows.user_id = ?
    SQL
    return nil if questions.empty?
    questions.map { |question| Question.new(question) }
  end

  def self.most_followed_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        question_id
      FROM
        question_follows
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC
      LIMIT 
        ?
    SQL
    return nil if questions.empty?
    # debugger
    questions.map { |question| Question.find_by_id(question["question_id"]) }
  end

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Reply
  attr_reader :user_id, :question_id, :parent_id
  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies
      WHERE 
        id = ?
    SQL
    return nil if reply.empty?
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT 
        * 
      FROM 
        replies
      WHERE 
        user_id = ?
    SQL
    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        * 
      FROM 
        replies
      WHERE 
        question_id = ?
    SQL
    return nil if replies.empty?
    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
    @reply_body = options['reply_body']
    @parent_id = options['parent_id']
  end

  def author 
    User.find_by_id(user_id)
  end

  def question 
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_id)
  end

  def child_replies(id = @id)
    children = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        replies
      WHERE 
        parent_id = ?
    SQL
    return nil if children.empty?
    children.map { |child| Reply.new(child) }
  end
end

class QuestionLike
  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        * 
      FROM 
        question_likes
      WHERE 
        id = ?
    SQL
    return nil if question_like.empty?
    QuestionLike.new(question_like.first)
  end

  def initialize(options)
    @user_like = options['user_like']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
