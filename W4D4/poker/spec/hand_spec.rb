require 'rspec'
require 'hand'
require 'deck'

describe Hand do 
  deck = Deck.new 
  subject(:hand) { Hand.new(deck) }
  describe "#initialize" do 
    it "should have 5 cards" do 
      expect(hand.length).to eq(5)
    end
    it "deck should have 47 cards after hand" do 
      expect(deck.length).to eq(47)
    end
  end
end