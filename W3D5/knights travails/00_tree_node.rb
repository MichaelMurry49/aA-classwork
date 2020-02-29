class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if @parent != nil 
            @parent.children.reject! {|child| child == self}
        end
        if new_parent != nil && !new_parent.children.include?(self) 
            new_parent.children << self
        end
        @parent = new_parent
    end

    def add_child(new_child)
        new_child.parent = self 
    end

    def remove_child(new_child)
        raise 'not a child' if !self.children.include?(new_child)
        new_child.parent = nil 
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result if result != nil
        end
        nil
    end

    def bfs(target)
        queue = [self]
        while !queue.empty?
            node = queue.shift 
            return node if node.value == target
            node.children.each do |child|
                queue << child 
            end
        end
        nil
    end
end