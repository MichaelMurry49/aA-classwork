class Board

   attr_reader :size

   def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
   end

   def [](position)   
        @grid[position[0]][position[1]]
   end

   def []=(position, value)
        @grid[position[0]][position[1]] = value
   end

   def num_ships
        @grid.flatten.count { |ele| ele == :S }
   end
   
   def attack(position)
       if self[position] == :S
          self[position] = :H 
          puts 'you sunk my battleship!'
          return true 
       else
          self[position] = :X
       end
          false
   end

   def place_random_ships
       ships = @size / 4
       
       while ships > 0 
          x = rand(0...@grid.length)
          y = rand(0...@grid.length)   
          if self[[x,y]] == :N
             self[[x,y]] = :S
             ships -= 1
          end     
       end
   end

   def hidden_ships_grid    
        @grid.map do |array|
            array.map do |ele|
                if ele == :S
                    ele = :N 
                else 
                    ele
                end
            end
        end
   end

   def self.print_grid(new_grid)
      new_grid.each do |arr|
          str = ""
          arr.each do |el|
               str += "#{el} "
          end
          print str.strip
          puts
      end
   end

   def cheat 
      Board.print_grid(@grid)
   end
   
   def print
      Board.print_grid(self.hidden_ships_grid)
   end

   
end
