class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    unless include?(key)
      @store[key.hash % num_buckets] << key
      @count += 1
    end
  end

  def include?(key)
    a = key.hash % num_buckets
    @store[a].include?(key)
  end

  def remove(key)
    if include?(key)
      @store[key.hash % num_buckets].delete(key)
      @count -= 1
    end
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end

  def num_buckets
    @store.length
  end

  def resize!
    temp = []
    num_buckets.times do 
      @store << []
    end
    @store.each_with_index do |bucket, i|
      temp += bucket
      @store[i] = []
    end
    @count = 0
    temp.each {|ele| insert(ele)}
  end
end


# set = ResizingIntSet.new(5)
# p set.store
# set.insert(5)
# set.insert(6)
# set.insert(7)
# set.insert(8)
# set.insert(9)
# p set.store
# set.insert(1)
# p set.store