require_relative 'piece.rb'
require_relative 'slideable'

class Rook < Piece
  include Slideable

  def initialize()
    super
  end

  def move_dirs
    HORIZONTAL_DIRS
  end
end