class GraphNode
    attr_accessor :val, :neighbors
    def initialize(val)
        self.val = val
        self.neighbors = []
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []
    until queue.empty?
        return queue[-1] if queue[-1].val == target_value
        visited << queue[-1]
        queue[-1].neighbors.each do |child|
            if !visited.include?(child)
                queue.unshift(child)
            end
        end
        queue.pop
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")

p bfs(a, "f")