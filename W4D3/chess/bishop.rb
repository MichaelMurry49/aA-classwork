require_relative 'piece.rb'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  def initialize(color, board, pos)
    super
  end

  def move_dirs
    DIAGONAL_DIRS
  end
end