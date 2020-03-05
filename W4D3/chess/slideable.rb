require 'byebug'

module Slideable
  HORIZONTAL_DIRS = [ [-1,0], [1,0], [0,-1], [0,1] ]
  DIAGONAL_DIRS = [ [1,1], [-1,1], [-1,-1], [1,-1] ]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    possible_moves = []
    move_dir = self.move_dirs
    move_dir.each do |dir|
      dx, dy = dir
      possible_moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    p possible_moves
  end

  def move_dirs
    raise 'need to be implemented'
  end


  def grow_unblocked_moves_in_dir(dx, dy)
    r, c = pos 
    next_r = r + dx
    next_c = c + dy
    valid_moves = []
    
    while (0..7).include?(next_r) && (0..7).include?(next_c)
      # debugger
      next_piece = board.rows[next_r][next_c]

      if board.rows[next_r][next_c] == nil 
        valid_moves << [next_r, next_c]
      else
        return valid_moves
      end

      next_r += dx
      next_c += dy 
    end
    valid_moves
  end

end

