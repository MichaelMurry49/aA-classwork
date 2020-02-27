require 'prime'

def strange_sums(arr)
    hash = {}
    counter = 0

    arr.each do |ele|
        if hash.has_key?(ele * -1)
            counter += 1
        else
            hash[ele] = true
        end
    end
    counter 
end

def pair_product(arr, product)
    arr.each.with_index do |ele1, i1|
        arr.each.with_index do |ele2, i2|
            return true if i2 > i1 && ele1 * ele2 == product
        end
    end
    return false
end

def rampant_repeats(str, hash)
    output = ''
    str.each_char do |char|
        if hash.has_key?(char)
            repeats = hash[char]
            repeats.times { output += char }
        else
            output += char
        end
    end
    output
end

def perfect_square(num)
    (1..num).any? { |fact| fact * fact == num}
end

def anti_prime?(num)
    most_divisors = 0
    n = 0
    (1..num).each do |ele|
        divs = count_divisors(ele)
        if divs > most_divisors
            most_divisors = divs
            n = ele 
        end
    end
    num == n
end

def count_divisors(num)
    count = 0
    (1..num).each {|n| count += 1 if num % n == 0}
    count
end

def matrix_addition(arr1, arr2)
    new_array = []
    arr1.each_with_index do |ele1, i|
        ele_sum = []
        ele_sum << ele1[0] + arr2[i][0]
        ele_sum << ele1[1] + arr2[i][1]
        new_array << ele_sum
    end

    new_array
end

def mutual_factors(*nums)
    divisors = []
    m = nums.min()
    (1..m).each do |num| 
         divisors << num if nums.all? {|n| n % num == 0}
    end
    return divisors      
end

def tribonacci_number(num)
    sequence = [1,1,2]
    return sequence[num - 1] if num < 4
    while sequence.length < num
        new_num = sequence[-3..-1].sum
        sequence << new_num
    end
    sequence[num - 1]
end

def matrix_addition_reloaded(*arr)
    (0...arr.length-1).each do |n|
       return nil if arr[n].length != arr[n+1].length
    end
    output = Array.new(arr[0].length) {Array.new(2, 0)} 

    arr.each_with_index do |sub_array, i|
        sub_array.each_with_index do |pair, j|
            output[j][0] += pair[0]
            output[j][1] += pair[1]
        end
    end

    output
end

def squarocol?(array)
    array.each_with_index do |ele, index|
        return true if ele.uniq.length == 1
        sym = array[0][index]
        col = []
        ele.each_with_index do |val, index2|
            col << array[index2][index] 
        end
        return true if col.all? { |n| n == sym}
    end
    false
end

def squaragonal?(arr)
    first = []
    (0..arr.length - 1).each do |index|
        first << arr[index][index]
    end
    return true if first.all? {|n| n == arr[0][0]}

    first = []
    index2 = 0
    (arr.length - 1).downto(0).each do |index|
        first << arr[index][index2]
        index2 += 1
    end
    return true if first.all? {|n| n == arr[0][-1]}
    false
end

def pascals_triangle(num)
    triangle = [[1]]
    while triangle.length != num

        triangle << next_level(triangle[-1])
    end
    return triangle
end

def next_level(arr)
    level = []
    i = 0
    while level.length < arr.length - 1
        level << arr[i] + arr[i + 1]
        i += 1
    end
    level.unshift(1).push(1)
end

def mersenne_prime(n) #  mersenne prime = (2^x) - 1      (2^4) - 1 = 31
    x = 2
    count = 0
    answer = 0
    while count < n
        if Prime.prime?(2 ** x - 1)
            count += 1
            answer = (2 ** x - 1)
        end
        x += 1
    end
    answer
end

def triangular_word?(word)
    alph = 'abcdefghijklmnopqrstuvwxyz'
    word_sum = 0
    word.each_char do |char|
        word_sum += alph.index(char) + 1
    end
    triangle = [1]
    while triangle[-1] < word_sum
        (0..word_sum).each do |i|
            triangle << (i * (i + 1)) / 2
        end
    end
    triangle.include?(word_sum)
end

def consecutive_collapse(arr)
    done = false
    while !done
        done = true
        (0...arr.length-1).each do |i|
            # print arr
            if (arr[i+1] - arr[i]).abs == 1
                arr.delete_at(i+1)
                arr.delete_at(i)
                done = false
                break
            end
        end
    end
    arr
end

def pretentious_primes(arr, num)
    arr.map! { |ele| find_n_primes(ele, num) } 
end

def find_n_primes(n, target) 
   global_max = 1 << 64
   largest_prime = 0
   count = 0
    if (target > 0)
        (n + 1...global_max).each do |ele|
            break if count == target
            if Prime.prime?(ele)
                largest_prime = ele
                count += 1
            end
        end
    else
        (n - 1).downto(2).each do |ele|
            break if count == target.abs
            if Prime.prime?(ele)
                largest_prime = ele
                count += 1
            end
        end
    end
    return nil if count < target.abs
    largest_prime
end


# when the number argument is positive, replace an element 
# with the n-th nearest prime number that is greater than the element

# when the number argument is negative, replace an element 
# with the n-th nearest prime number that is less than the element

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

# p find_n_primes(15, 3)