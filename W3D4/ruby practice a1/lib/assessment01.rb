class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    i = accumulator == nil ? 1 : 0
    accumulator ||= self[0]

    while i < self.length 
      accumulator = prc.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num <= 1
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  return [] if num == 0
  output = []
  i = 2
  while output.length != num
    if is_prime?(i)
      output << i 
    end
    i += 1
  end
  output
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2
  fac = factorials_rec(num - 1)
  fac << (num - 1) * fac[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = [] }
    self.each_with_index do |ele, index | 
      hash[ele] << index if self.index(ele) != self.rindex(ele)
    end
    hash
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    res = []
    (0...self.length).each do |i|
      sub = self[i]
      (i + 1...self.length).each do |j|
        sub += self[j]
        res << sub
      end
    end
    res.select { |ele| ele == ele.reverse && ele.length > 1 }
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self.dup if self.length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
    
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    i = 0
    j = 0
    while i < left.length && j < right.length
      if prc.call(left[i], right[j]) == -1
        merged << left[i]
        i += 1
      else 
        merged << right[j]
        j += 1
      end
    end
    merged + left[i..-1] + right[j..-1]
  end
end
