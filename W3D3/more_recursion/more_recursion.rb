def rec_range(left,right)
    return [] if left > right
    return [] if right == left
    [left] + rec_range(left + 1,right)
end

# p rec_range(1,5)
# p rec_range(5,5)

###########################

def iter_range(left,right)
    array = []
    (left...right).each { |i| array << i }
    array
end

# p iter_range(5,5)
# p iter_range(1,5)
# p iter_range(6,5)

#########################
def exp_1(base, n)
    return base if n == 1
    base * exp_1(base, n -1)
end

# p exp_1(2,2) # 4
# p exp_1(3,2) # 9
# p exp_1(4,2) # 16
# p exp_1(2,3) # 8

#######################

def exp_2(base,n)
    return 1 if n == 0
    if n.even?
        return exp_2(base, n / 2) ** 2
    else
        return base * (exp_2(base, (n - 1) / 2) ** 2)
    end
end

# p exp_2(2,2) # 4
# p exp_2(3,2) # 9
# p exp_2(4,2) # 16
# p exp_2(2,3) # 8

#######################
class Array
    def deep_dup
        return [self.dup] if !self.is_a?(Array)
        new_array = []
        self.each do |sub|
            if !sub.is_a?(Array)
                new_array << sub
            else 
                new_array << sub.deep_dup
            end
        end
        new_array
    end
end


# robot_parts = [
#   ["nuts", ["bolts"], "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# # [1, [2], [3, [4]]].deep_dup
# # p robot_parts.deep_dup
# robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts # => ["capacitors", "resistors", "inductors", "LEDs"]
# p robot_parts_copy
# p robot_parts.object_id == robot_parts_copy.object_id # false
# p robot_parts[0][1].object_id == robot_parts_copy[0][1].object_id # true needs false

#################################

def fib_rec(n)
    return [] if n < 1
    return [0] if n == 1
    return [0,1] if n == 2
    fibs = fib_rec(n - 1)
    # fibs << fibs[-1] + fibs[-2]
    # fibs += fib_rec(n - 1)
    fibs.push(fibs[-1] + fibs[-2])

end

# p fib_rec(5)
# p fib_rec(1)
# p fib_rec(2)
# p fib_rec(0)
# p fib_rec(6)
# p fib_rec(7)
# p fib_rec(8)



def fib_iter(n)
    return [] if n < 1
    return [0] if n == 1
    return [0,1] if n == 2
    array = [0,1]
    counter = 2
    while counter != n
        array << array[-1] + array[-2]
        counter += 1
    end
    array
end

# p fib_iter(5)
# p fib_iter(1)
# p fib_iter(2)
# p fib_iter(0)
# p fib_iter(6)
# p fib_iter(7)
# p fib_iter(8)

###########################

def bsearch(array,targ)
    return nil if array.length == 0 
    mid = array.length / 2
    if array[mid] == targ
        return mid
    elsif targ > array[mid]
        res = bsearch(array[mid + 1..-1], targ)
        if res == nil
            return nil
        else
            res += mid + 1
            return res
        end
    else
        bsearch(array[0...mid], targ)
    end
end
# # p ([1,2,3,4,5,6,7,8,9],4)
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

##############################

def merge_sort(arr) # [5,1,7,10,15]
    return [] if arr.length == 0
    return arr if arr.length == 1
    mid = arr.length / 2 # mid = 2
    #merge_sort([1,5,7]) merge_sort([10,15])
    # p arr
    merge(merge_sort(arr[0...mid]), merge_sort(arr[(mid + 1)..-1]))

end
       
def merge(left,right) 
    new_array = []
    num = left.length + right.length
    i = 0
    while i < num
        if left.length != 0 && right.length != 0 
            if left[0] <= right[0]
                new_array << left.shift
            else
                new_array << right.shift
            end
        else
            break
        end
        i += 1
    end

    if left.length == 0
        new_array += right
    else 
        new_array += left
    end
    new_array
end

# p merge_sort([5,1,7,10,15,4,2,33,100,3,9,21,44,8])

#################################

# def subsets(#[1,2])
#     return [arr] if arr.length < 1
#     new_array = []
#     # arr.pop
#     # p arr
    
#     last = arr.last #2
#     new_array += subsets(arr[0...-1]) #[[], [1], ]
#     result = new_array.dup 
#     new_array.each do |sub|
#         result << sub.dup.push(last)
#     end
#     result
# end

#[[]] => []
#[[1], []] => 1
#[[1], [], [1,2], [2]] => [1,2]
#[[1], [], [1,2], [2], [1, 3], [3], [1,2,3], [2,3]]


# p subsets([]) # => [[]]
# puts
# p subsets([1]) # => [[], [1]]
# puts
#p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# puts
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

##############################

def permutations(array) # [2,3]
    return array if array.length == 1
    result = []
    (0...array.length).each do |i| # i = 1, array[i] = 3
        #p result
        head = array[0...i] #[2]
        rest = array[i+1..-1] #[]
        temp = permutations( head + rest) # [2,3]
        if temp[0].is_a?(Array)
            temp.map { |sub| sub.unshift(array[i]) }
            result += temp
        else
            temp.unshift(array[i])
            result << temp
        end
    end
    result
end

# p permutations([1,2,3])

################################

def make_change(amt, coins=[25, 10, 5, 1]) #amt = 0
    return [] if amt == 0
    result = []
    (0...coins.length).each do |i| 
        if amt >= coins[i] #1 - 1 = 0
            result += [coins[i]]
            result += make_change(amt - coins[i],coins)
            break
        end            
    end
    result
end
p make_change(24, [10,7,1])
p make_change(15)
p make_change(20)
p make_change(50)
p make_change(51)





