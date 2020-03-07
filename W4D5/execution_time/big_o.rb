def my_min(array) # O(n^2)
  array.each_with_index do |ele1, idx1|
    flag = true
    array.each_with_index do |ele2, idx2|
      flag = false if ele2 < ele1 
    end
    return ele1 if flag
  end
end
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def my_min_two(array) #O(n)
  min_val = nil
  array.each do |ele|
    if min_val == nil || ele < min_val
      min_val = ele 
    end
  end
  min_val
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_two(list)


def largest_contiguous_subsum(array)
  # O(n^2)
  sums = []
  (0...array.length).each do |i|
    (i...array.length).each do |j|
      sums << array[i..j]
    end
  end
  res = sums.first
  sums.each do |sum| 
    if sum.sum > res.sum
      res = sum
    end
  end
  res.sum
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) #=> 8

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_contiguous_subsum_two(array)
  #O(n)
  max_sum = array.first #2
  sum = max_sum #2
  array.drop(1).each do |ele| #7
    if ele > max_sum
      max_sum = ele #7
      sum = ele #7
    else
      sum += ele #8
    end
    max_sum = sum if sum > max_sum #8
  end
  max_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum_two(list) #=> 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_two(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum_two(list) # => -1 (from [-1])
