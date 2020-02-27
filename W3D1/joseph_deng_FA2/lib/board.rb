class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(num)
        Array.new(num) { Array.new(0) }
    end

    def initialize(n, max_height)
        if max_height < 4 || n < 4
            raise 'rows and cols must be >= 4'
        end
        @max_height = max_height
        @stacks = Board.build_stacks(n)
    end

    def max_height
        @max_height
    end

    def add(token, index)
        if @stacks[index].length >= @max_height
            return false
        else 
            @stacks[index] << token 
        end
        true
    end

    def vertical_winner?(token)

        @stacks.each do |stack|
            if stack.length == @max_height 
                return true if stack.all? { |ele| ele == token}
            end
        end
        false
    end

    def horizontal_winner?(token)
       
        (0...@max_height).each do |i|
            count = 0
            (0...@stacks.length).each do |j|
                count += 1
                break if @stacks[j][i] != token
            end
            return true if count == @stacks.length
        end
        false
    end

    def winner?(token)
        return true if vertical_winner?(token) || horizontal_winner?(token)
        false
    end
end
