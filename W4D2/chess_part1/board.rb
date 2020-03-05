require_relative "piece.rb"

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

    if self[start_pos] == nil 
      puts 'Invalid position'
      return
    end

    if self[end_pos] != nil 
      puts 'Invalid position'
      return
    end
 
       x_s, y_s = start_pos
       x, y = end_pos
      @rows[x][y] = @rows[x_s][y_s]
  end

  def [](pos)
    r, c = pos[0], pos[1]
    @rows[r][c] 
  end


end