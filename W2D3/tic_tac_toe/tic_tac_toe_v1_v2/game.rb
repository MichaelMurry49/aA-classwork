require_relative 'board'
require_relative 'human_player'

class Game
    def initialize(n,*players_mark)
        @players = players_mark.map{|mk| Human_Player.new(mk)}
        @board = Board.new(n)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play 
        while @board.grid.flatten.include?('_')
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                p "Player #{@current_player.mark} win!"
                return 
            else 
                self.switch_turn
            end
        end
        @board.print
        p 'We have a draw'
    end
end

game = Game.new(5,'x')
game.play