require_relative '00_tree_node'
require "byebug"

class KnightPathFinder
    attr_accessor :root_node, :considered_positions

    def self.valid_moves(pos)  # [4,4]
        # [[3, 2], [2, 3], [2, 5], [3, 6], [5, 2], [6, 3], [6, 5], [5, 6]]
        #[3,2], [3,6], [2,3], [2,5], [5,6], [5, 2]
# [][].,[],[x-1, y-2],x-2,, y-1x-2, y+1[]
#         x-1, x-2, x+1, x+2, y-1, y-2, y+1, y+2
        result = []
        possible_moves = [[-1, -2], [-2, -1], [-2, 1],[-1, 2], [1, -2], [2, -1], [2, 1], [1, 2]]
        x, y = pos

        possible_moves.each do |move|
          new_x = x + move[0] 
          new_y = y + move[1]
          if new_x >= 0 && new_x < 8 && new_y >= 0 && new_y < 8
            result << [new_x, new_y]
          end
        end
        result
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree
    end

    def build_move_tree
        q = [root_node]
        # debugger
        until q.empty?
          node = q.shift
          moves = new_move_positions(node.value)
          moves.each do |move|
              child = PolyTreeNode.new(move)
              node.add_child(child)
              q.push(child)
          end
        end
    end

    def new_move_positions(pos)
      duped = considered_positions.dup
      @considered_positions += KnightPathFinder.valid_moves(pos).reject { |move| @considered_positions.include?(move) }
      @considered_positions.reject { |move| duped.include?(move) }
    end

    def find_path(end_pos)
      path_node = root_node.dfs(end_pos)
      paths = []
      until path_node == nil
        paths.unshift(path_node.value)
        path_node = path_node.parent 
      end
      return paths
    end
end