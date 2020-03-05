


module Stepable

  def moves
    dirs = move_diffs
    possible_moves = []
    x, y = pos
    
    dirs.each do |dir|
      dx, dy = dir
      next_x = x + dx
      next_y = y + dy
      
      if board.rows[next_x][next_y] == nil && (0..7).include?(next_x) && (0..7).include?(next_y)
        possible_moves << [next_x, next_y]
      end
    end

    possible_moves

  end

end