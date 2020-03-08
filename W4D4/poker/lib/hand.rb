require 'deck'

class Hand < Array
  def initialize(deck)
    5.times { self << deck.pop }
  end
end