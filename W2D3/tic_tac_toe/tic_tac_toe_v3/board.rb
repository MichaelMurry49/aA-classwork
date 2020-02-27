#require_relative "game.rb" 
require_relative "human_player.rb" 
class Board 
    attr_reader :grid 
    def initialize(n)
        @n = n
        @grid = Array.new(n){Array.new(n,"_")}
    end
    def valid?(position)
       (position[0] < @n && position[0] >=0 )&&(position[1] < @n && position[1] >=0 )
    end
    def [](position)
         @grid[position[0]][position[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def empty?(position)
        self[position] == "_"
    end
   
    def place_mark(position , mark)
        if self.empty?(position) && self.valid?(position)
           self[position] = mark
        else
            puts "here is not empty or this position is invalid"
        end
    end

    def print
        @grid.each do |arr|
            new_str = ""
            arr.each do |el|
                new_str += "#{el} "
            end
            p new_str.strip 
            puts
        end
        
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?{|mk| mk == mark}}
    end
    
    def win_col?(mark)
        @grid.transpose.any?{|col| col.all?{|mk| mk == mark}}
    end

    def win_diagonal?(mark)
       i = 0 
       while i < @grid.length 
          if @grid[i][i] != mark
            break
          end
          i += 1
       end
       return true if i == @grid.length 
       i = 0 
       j = @grid.length - 1
       while i < @grid.length
          if @grid[i][j] != mark
             break
           end
           i += 1
           j -= 1
       end
       return true if i == @grid.length
       false
    end 

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any?("_")
    end

    def legal_positions
        l_positions = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |p, j|
                if p == '_'
                    l_positions << [i, j]
                end
            end
        end
        l_positions
    end
end



