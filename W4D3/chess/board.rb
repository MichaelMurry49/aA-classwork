require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "queen"
require_relative 'null_piece'
require_relative 'knight'
require_relative 'king'

class Board
  attr_reader :rows

  def initialize

    @rows = Array.new(8) { Array.new(8) }
    (0...@rows.length).each do |i|
      (0...@rows.length).each do |j|
        if i == 0 || i == 7
          @rows[i][j] = Piece.new(:red, @rows, [i,j])
        else
          @rows[i][j] = nil
        end
        
      end
    end
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos[0]][start_pos[1]]  == nil 
      puts 'Invalid position'
      return
    end

    if end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
      puts 'Invalid position'
      return
    end
 
       x_s, y_s = start_pos
       x, y = end_pos
      @rows[x][y] = @rows[x_s][y_s]
  end

  # def [](pos)
  #   r, c = pos[0], pos[1]
  #   @rows[r][c] 
  # end


end



board = Board.new
# bis = Bishop.new('white', board, [4,4])
# rook = Rook.new("white", board, [4,4])
# queen = Queen.new("white", board, [4,4])
# queen.moves
king = Bishop.new('white', board, [4,4])


p king.moves