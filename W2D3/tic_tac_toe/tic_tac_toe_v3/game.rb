require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    def initialize(n,players_hash)
        @players = []
        @board = Board.new(n)
        players_hash.each do |k, v|
            if v
                @players << Computer_Player.new(k)
            else
                @players << Human_Player.new(k)
            end
        end
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play 
        while @board.grid.flatten.include?('_')
            @board.print
            position = @current_player.get_position(@board.legal_positions)
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

machine_civil_war = Game.new(10, h: true, u: true, e: true, x: false)
machine_civil_war.play