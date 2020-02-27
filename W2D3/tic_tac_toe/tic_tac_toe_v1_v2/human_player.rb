class Human_Player
    attr_reader :mark 
    
    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player #{@mark}, enter row and column with space in between, like 1 2."
        input = gets.chomp.split(' ')
        p 'Sorry, that was invalid :(' if input.length != 2
        input.map { |ele| ele.to_i }
    end


end