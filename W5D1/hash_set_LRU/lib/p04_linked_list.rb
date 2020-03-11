class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new 
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.object_id == @tail.object_id
  end

  def get(key)
    runner = @head.next
    while runner != @tail 
      if key == runner.key 
        return runner.val
      end
      runner = runner.next
    end
    nil 
  end

  def include?(key)
    runner = @head.next
    while runner != @tail 
      if key == runner.key 
        return true
      end
      runner = runner.next
    end
    false 
  end

  def append(key, val)
    new_node = Node.new(key, val)
    node1 = @tail.prev 
    new_node.prev = node1
    node1.next = new_node
    @tail.prev = new_node 
    new_node.next = @tail 
  end

  def update(key, val)
    runner = @head.next
    while runner != @tail 
      if key == runner.key 
        runner.val = val 
        return 
      end
      runner = runner.next
    end
  end

  def remove(key)
    runner = @head.next
    while runner != @tail 
      if key == runner.key 
        pre_node = runner.prev 
        next_node = runner.next 
        pre_node.next = next_node
        next_node.prev = pre_node
      end
      runner = runner.next
    end
  end

  def each
    # runner = @head.next
    # while runner.next != @tail 
    #   yield(runner.val)
    #   runner = runner.next
    # end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
