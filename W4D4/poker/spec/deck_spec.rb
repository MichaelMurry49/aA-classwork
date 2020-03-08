require 'rspec'
require 'deck'

describe Deck do
  subject(:deck){Deck.new}

  describe 'initialize' do
    it 'initialize with standard 52 cards' do
      expect(deck.length).to eq(52)
    end
    it 'initialize with 52 unique cards' do
      expect(deck.uniq.length).to eq(52)
    end
  end
end



