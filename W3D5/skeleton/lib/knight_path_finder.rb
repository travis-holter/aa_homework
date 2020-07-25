require_relative "00_tree_node.rb"

class KnightPathFinder

    attr_accessor :considered_positions

    def self.valid_moves?(pos)
        valid_moves = []
        x, y = pos
        valid_moves << [x + 2, y + 1] if x + 2 < 8 && y + 1 < 8
        valid_moves << [x - 2, y + 1] if x - 2 > 0 && y + 1 < 8
        valid_moves << [x + 2, y - 1] if x + 2 < 8 && y - 1 > 0
        valid_moves << [x - 2, y - 1] if x - 2 > 0 && y - 1 > 0
        valid_moves << [x + 1, y + 2] if x + 1 < 8 && y + 2 < 8
        valid_moves << [x - 1, y + 2] if x - 1 > 0 && y + 2 < 8
        valid_moves << [x + 1, y - 2] if x + 1 < 8 && y - 2 > 0
        valid_moves << [x - 1, y - 2] if x - 1 > 0 && y - 2 > 0
        valid_moves
    end

    def initialize(starting_pos)
        @root_node = PolyTreeNode.new(starting_pos)
        @considered_positions = [starting_pos]
    end

    def new_move_positions(pos)
        result = []
        
        KnightPathFinder.valid_moves?(pos).each do |position|
            if !@considered_positions.include?(position)
                @considered_positions << position
                result << position
            end
        end
        result
    end

    def build_move_tree(start_node)
       queue = [start_node]
       next_moves = []
       start_pos = start_node.considered_positions[0]
       until queue.empty?
            new_move_positions(start_pos).each do |pos|
                queue.unshift(PolyTreeNode.new(pos))
            end
        queue.pop
        end
        next_moves
    end
       
       
        # new_moves = self.new_move_positions(self.root_node.value)

        # until new_moves.empty?

            
        # queue = [start_node]
        # new_moves = []
        # until queue.empty?
        #     start_node.position
        # end
        # new_moves


end


k = KnightPathFinder.new([0,0])
# k.considered_positions << [2,1]
# k.new_move_positions([0,0])
p k.build_move_tree()
