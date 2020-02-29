require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node, :considered_positions

    def self.valid_moves(pos) 
        x, y = pos 
        moves = []
        possible_moves = [[-1, -2], [-1, 2], [-2, -1], [-2, 1], [1, -2], [1, 2], [2, -1], [2, 1]]
        possible_moves.each do |move|
            move_x, move_y = move 
            new_x = x + move_x 
            new_y = y + move_y
            if new_x < 8 && new_x >= 0 && new_y < 8 && new_y >= 0
                moves << [new_x, new_y] 
            end
        end
        moves
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def build_move_tree
        queue = [root_node]
        until queue.empty?
            node = queue.shift
            moves = new_move_positions(node.value)
            moves.each do |move|
                child = PolyTreeNode.new(move)
                queue.push(child)
                node.add_child(child)
            end
        end
    end

    def inspect
      q = [root_node]
      until q.empty?
        size = q.length
        (0...size).each do |i|
          node = q.shift 
          print "#{node.value} "
          node.children.each { |child| q.push(child) }
        end
        puts 
      end
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        new_moves = possible_moves.reject { |move| considered_positions.include?(move) }
        new_moves.each { |move| considered_positions << move }
        new_moves
    end
end

kpt = KnightPathFinder.new([0, 0])
kpt.build_move_tree
kpt.inspect