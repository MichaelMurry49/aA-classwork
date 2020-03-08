require 'rspec'
require 'card'

describe Card do
  subject(:card){Card.new(7,"s")}
  describe 'Card#initialize' do
    it "creates card with correct value" do
      expect(card.val).to eq(7)
    end
    it "creates card with correct suit" do
      expect(card.suit).to eq("s")
    end
  end
end

