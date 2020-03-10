class MaxIntSet
  attr_reader:store
  def initialize(max)
    @max = max 
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
     @store[num % num_buckets] << num
  end

  def remove(num)
    bucket = @store[num % num_buckets]
    if include?(num)
      bucket.each do |ele|
        if ele == num
          bucket.delete(num)
        end
      end
    end
  end

  def include?(num)
    return true if @store[num % num_buckets].include?(num)
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    if !include?(num)
      @store[num % num_buckets] << num 
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

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