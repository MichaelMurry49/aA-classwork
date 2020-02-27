class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    length = @secret_word.length
    @guess_word = Array.new(length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    array = []
    @secret_word.each_char.with_index { |letter, index| array << index if letter == char }
    array
  end

  def fill_indices(char, array)
    array.each { |ele| @guess_word[ele] = char }
    @guess_word
  end

  def try_guess(char)
      if already_attempted?(char)
        p "that has already been attempted"
        return false
      else 
        @attempted_chars << char
        if get_matching_indices(char).length == 0
          @remaining_incorrect_guesses -= 1
        else
          fill_indices(char,get_matching_indices(char))
        end
      end
      return true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    false
  end
end


