class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(node)
        @value = node
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        
        # p self n3.parent == n2
        if @parent != nil 
            @parent.children.reject! {|child| child == self}
        end
        if new_parent != nil && !new_parent.children.include?(self) 
            new_parent.children << self
        end
        @parent = new_parent

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2
    end

    def add_child(new_child)
        new_child.parent = self 
    end

    def remove_child(new_child)
        raise 'not a child' if !self.children.include?(new_child)
        new_child.parent = nil 
    end

    def dfs(target)
        # return nil if self == nil
        return self if self.value == target
        #base case
        self.children.each do |child|
            result = child.dfs(target)
            return result if result != nil
        end
        nil
    end

    def bfs(target)
        #root_node [n1,n2]
        #n1 [n3,n4]    n2[n5,n6]

        #q = [root_node]
        # q=[n3,n4] 
        #n2 => get all n2's children [n]
        queue = [self]
        while !queue.empty?
            node = queue.shift #q= [] node = root
            return node if node.value == target
            node.children.each do |child|
                queue << child 
            end
        end
        nil
    end

end