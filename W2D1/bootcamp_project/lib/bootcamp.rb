class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity

    @teachers = []
    @students = []
    @grades = Hash.new() { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @student_capacity > @students.length
      @students << student
      return true
    end
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] << grade
      return true
    end
    false
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    average_grade = 0
    return nil if @grades[student].length == 0
    @grades[student].each { |grade| average_grade += grade }
    average_grade / @grades[student].length
  end
end
