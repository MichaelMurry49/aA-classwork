require 'rspec'
require 'tower_of_hanoi'

describe Tower_of_Hanoi do
  subject(:game) do 
      Tower_of_Hanoi.new(4)
  end
  
  it "initialize" do 
    expect(game.disks).to eq([[4,3,2,1],[],[]])
  end

  describe "move" do 
    subject(:game) do 
      Tower_of_Hanoi.new(4)
    end

    before(:each) do 
      game.move(0, 1)
    end

    it "when disks that the user places is bigger than the disk below it, raise error" do
      expect{ game.move(0, 1) }.to raise_error("invalid move")
    end
    
    it "when move is valid" do
      game.move(0, 2) 
      expect(game.disks).to eq([[4,3],[1],[2]])
    end
  end
end