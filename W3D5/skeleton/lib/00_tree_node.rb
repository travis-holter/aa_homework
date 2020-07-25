require "byebug"

class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent_node)
        # return nil if self.parent = nil
        old_parent = self.parent
        if old_parent != nil && old_parent.children.include?(self)
            old_parent.children.delete(self)
        end 
        @parent = new_parent_node #unless self.parent == nil
        if new_parent_node != nil                              #if you 
            new_parent_node.children << self if !new_parent_node.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "No parents!" if child_node.parent == nil
        child_node.parent = nil
    end


    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            node = child.dfs(target)
            return node if node != nil            #has to be nil since the result of dfs can be either the node or nil
        end
        
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            return queue[-1] if queue[-1].value == target
            #right side is front, left is back
            queue[-1].children.each { |child| queue.unshift(child) }
            queue.pop
        end
        nil
    end

end

