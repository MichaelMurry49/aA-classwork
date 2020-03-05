require_relative 'piece'
require 'singleton'

class Nullpiece < Piece
  include Singleton

  def initialize
    @color = :none
    @board = nil 
    @pos = []
  end

  def move_dirs
    []
  end
end