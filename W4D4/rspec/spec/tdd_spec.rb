require 'rspec'
require 'tdd'
require 'spec_helper'
require 'tower_of_hanoi'

describe Array do
  describe "Array#uniq" do
    it "when there are duplicates, remove from array" do
      expect([1,2,1,3,3].uniq).to eq([1,2,3])
    end
  end

  describe "Array#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero " do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "Array#my_transpose" do
    let(:rows) do
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]       
    end
    let(:cols) do
      [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]       
    end    
    it "will convert between the row-oriented and column-oriented representations" do
      expect(rows.my_transpose).to eq(cols)
    end
  end

  describe "Array#stock_picker" do
    let(:prices) do
      [1,6,5,6,9,3,1,8,7,8]
    end

    let(:prices_2) do
      [8,6,9,1,9,3,1,8,7,8]
    end
    it "will pick most profitable pair of days to first buy and then sell the stock" do
      expect(prices.stock_picker).to eq([0,4])
    end
    it "deal with duplicate values" do
      expect(prices_2.stock_picker).to eq([3,4])
    end    
  end

end
