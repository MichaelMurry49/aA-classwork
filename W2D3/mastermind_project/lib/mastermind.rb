require_relative "code"

class Mastermind

    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code)
        p 'Exact matches: ' + @secret_code.num_exact_matches(code).to_s 
        p "Near mateches: #{@secret_code.num_near_matches(code)}"
    end

    def ask_user_for_guess
        puts 'Enter a code'
        input = gets.chomp
        current_code = Code.from_string(input)
        print_matches(current_code)
        current_code == @secret_code
    end
end
