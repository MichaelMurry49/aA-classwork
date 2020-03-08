require 'card'
class Deck < Array
  def initialize
    seq = ("2".."10").to_a
    seq += ["J", "Q", "K", "A"]
    seq.each do |val|
      ["S", "D", "H", "C"].each do |suit|
        self << val + suit
      end
    end
  end
end