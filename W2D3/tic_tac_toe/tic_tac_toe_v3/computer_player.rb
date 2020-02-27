require_relative 'board'

class Computer_Player
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        p "Computer #{@mark} chose position #{position[0]}, #{position[1] }"
        position
    end
end