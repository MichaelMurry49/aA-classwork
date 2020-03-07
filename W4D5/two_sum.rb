def bad_two_sum?(arr, target)
  #O(n^2)
  pairs = []
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      pairs << [arr[i], arr[j]]
    end
  end
  pairs.each do |pair|
    return true if pair.sum == target
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum(arr, target)
  #O(n)
  arr.sort!
  i = 0
  j = arr.length - 1
  while i < j
    sum = arr[i] + arr[j]
    return true if sum == target
    if sum < target
      i += 1
    else
      j -= 1
    end
  end
  false
end

arr = [7, 5, 1, 0]
# p okay_two_sum(arr, 6) # => should be true
# p okay_two_sum(arr, 10) # => should be false

def two_sum?(array, target)
  #O(n)
  hash = Hash.new(0)
  i = 1
  array.each do |ele|
    hash[ele] = i 
    i += 1
  end
  hash.each_key do |k|
    return true if hash.has_key?(target - k) && hash[k] != hash[target - k]
  end
  false 
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false