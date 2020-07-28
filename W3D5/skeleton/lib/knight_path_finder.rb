require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder

    attr_accessor :considered_positions, :root_node

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
        self.build_move_tree
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
   
       

    def build_move_tree
        # debugger
    #    start = self.considered_positions[0]
       queue = [@root_node]
        until queue.empty?
            pnt = queue[-1]
            new_move_positions(pnt.value).each do |pos|
                cld = PolyTreeNode.new(pos)
                cld.parent = pnt
                pnt.add_child(cld)
                queue.unshift(cld)
            end 
            queue.pop
        end
    end
 
    def find_path(end_pos)
        found = self.root_node.dfs(end_pos)
        print trace_path_back(found)
    end

    def trace_path_back(node)
        path = []
        current_node = node
        until current_node.parent.nil?
            path.unshift(current_node.value)
            current_node = current_node.parent
        end
        path.unshift(current_node.value)
        path
    end
    
end


# k = KnightPathFinder.new([0,0])
# k.considered_positions << [2,1]
# k.new_move_positions([0,0])
# k.root_node.children.each do |child| 
#     child.children.each do |sub|
#         p sub.value
#     end
# end
# k.find_path([7,7])

kpf = KnightPathFinder.new([0, 0])
puts kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
puts kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]