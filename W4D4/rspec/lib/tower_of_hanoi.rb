require 'byebug'

class Tower_of_Hanoi
  attr_reader :disks
  def initialize(n)
    @disks = [[],[],[]]
    @disks[0] = (1..n).to_a.reverse
  end

  def move(start, finish)
    # debugger
     raise "invalid move" if !@disks[finish].empty? && @disks[finish][-1] < @disks[start][-1]
     @disks[finish] << (@disks[start].pop) 
     p [disks, "here"]
  end

  def run
    while !won?
      puts "enter start and end position"
      input = gets.chomp.split(' ').map! { |ele| ele.to_i }
      move(input[0], input[1])
    end
  end

  def won?
    @disks[0].length == 0 && @disks[1].length == 1
  end
end

game = Tower_of_Hanoi.new(4)
p game.disks