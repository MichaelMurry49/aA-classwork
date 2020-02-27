require_relative "board"
require_relative "player"

class Battleship

    attr_reader :player, :board

    def initialize(len)
        @player = Player.new()
        @board = Board.new(len)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'you lose'
            return true
        else
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        end
        false
    end

    def turn
        if !@board.attack(@player.get_move)
            @remaining_misses -= 1
        end
      print @board.print
      puts @remaining_misses
    end

end
