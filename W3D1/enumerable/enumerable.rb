require "byebug"

class Array

    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i]) 

            i += 1
        end

        self
    end

    def my_select(&prc)
        array = []

        self.my_each { |ele| array << ele if prc.call(ele) }

        array

    end

    def my_reject(&prc)
        array = []

        self.my_each { |ele| array << ele if !prc.call(ele) }

        array
    end

    def my_all?(&prc)
        count = 0

        self.my_each { |ele| count += 1 if prc.call(ele) }

        count == self.length
    end

    def my_any?(&prc)

        self.my_each { |ele| return true if prc.call(ele) }

        return false

    end

    def my_flatten
        
        return [self] if !self.is_a? Array
        
        result = []

        self.my_each do |ele|
            if !ele.is_a? Array 
                result << ele 
            else
                result += ele.flatten
            end
        end

        result
    end

    def my_zip(*args)
        result = []

        (0...self.length).each do |i|
            sub = [self[i]]

            (0...args.length).each do |j|
                sub << args[j][i]
            end

            result << sub
        end
        
        result
    end

    def my_rotate(num = 1)
        duplicate = self.dup
        if num > 0
            num.times do 
                duplicate.push(duplicate.shift)
            end
            # num.times { self.push(self.shift) }
        else
            num.abs.times do
                duplicate.unshift(duplicate.pop)
            end
        end
        duplicate
    end

    def my_join(seperator = '')
        new_string = ''
        self.each_with_index do |ele, index|
            if index != self.length - 1
                new_string += ele + seperator
            else
                new_string += ele
            end
        end
        new_string
    end


    def my_reverse
        return self if self.length <= 1
        result = []
        i = self.length - 1
        while i >= 0
            result << self[i]
            i -= 1
        end
        result
    end

    def factors(num)
       result = []
       self.each do |ele|
            result << ele if num % ele == 0
       end
       result
    end

    def bubble_sort!(&prc)
        sorted = false

        while !sorted
            sorted = true
            (0...self.length).each do |i|
                if prc.call(self[i], self[i + 1]) == 1
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end

        self
    end

    def bubble_sort(&prc)

        duplicate = self.dup

        sorted = false

        while !sorted
            sorted = true
            (0...duplicate.length).each do |i|
                if prc.call(duplicate[i], duplicate[i + 1]) == 1
                    duplicate[i], duplicate[i + 1] = duplicate[i + 1], duplicate[i]
                    sorted = false
                end
            end
        end

        duplicate
    end

    def substrings(string)
        result = []
        (0...string.length).each do |i|'cats'
            sub_string = string[i]
            result << sub_string
            (i + 1...string.length).each do |j|
                sub_string += string[j]
                result << sub_string
            end
        end
        result
    end
end

 def substrings(string)
        result = []
        (0...string.length).each do |i|'cats'
            sub_string = string[i]
            result << sub_string
            (i + 1...string.length).each do |j|
                sub_string += string[j]
                result << sub_string
            end
        end
        result
    end
    
str = "cats"

p substrings(str)

# arr = [3, 5, 1, 4, 6]
# p arr.bubble_sort { |a, b| a <=> b }



# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value