require_relative '00_tree_node'

class KnightPathFinder
    attr_reader :root_node, :considered_positions

    def self.valid_moves(pos)  # [4,4]
        # [[3, 2], [2, 3], [2, 5], [3, 6], [5, 2], [6, 3], [6, 5], [5, 6]]
        #[3,2], [3,6], [2,3], [2,5], [5,6], [5, 2]
# [][].,[],[x-1, y-2],x-2,, y-1x-2, y+1[]
#         x-1, x-2, x+1, x+2, y-1, y-2, y+1, y+2
        result = []
        x, y = pos 
        if (x + 1 <= 7 || x + 2 <= 7 || y + 1 <= 7 || y + 2 <= 7) && (x - 1 >= 0 || x - 2 >= 0|| y - 1 >= 0 || y - 2 >= 0)
            result << 
        end
        (0...8)


    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def build_move_tree
        
    end

    def new_move_positions(pos)

        KnightPathFinder.valid_moves(pos)
    end
end