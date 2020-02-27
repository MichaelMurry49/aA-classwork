class Human_Player
    attr_reader :mark 
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        p "please enter a position :  like 1 4"
        inputs = gets.chomp.split(" ").map{|s| s.to_i}
        while !self.valid(inputs, legal_positions)
             p "invalid input, please enter a position :  like 1 4"
             inputs = gets.chomp.split(" ").map{|s| s.to_i}
        end
        inputs
        
    end

    def valid(inputs ,legal_positions)
        return false if inputs.length != 2
        if legal_positions.include?(inputs)
            return true
        end
        false
    end
end



