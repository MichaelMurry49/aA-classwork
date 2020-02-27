def partition(arr, num)
    output = [[],[]]
    arr.each do |ele|
        if ele >= num
            output[1] << ele
        else 
            output[0] << ele
        end
    end
    output 
end

def merge(hash1, hash2)
    newHash = Hash.new()
    hash1.each { |key, value| newHash[key] = value }
    hash2.each { |key, value| newHash[key] = value }

    newHash
end

def censor(str,arr)
    words = str.split(" ")

    words.each_with_index do |word, i|
        if arr.include?(word.downcase)
            new_str = ''

            word.each_char do |char|
                if 'aeiou'.include?(char.downcase)
                    new_str += '*'
                else
                    new_str += char
                end
            end

            words[i] = new_str
        end
    end

    words.join(" ")
end

def power_of_two?(num)

    return true if num < 2
    while num != 2
        if num % 2 != 0
            return false
        else
            num /= 2
        end
    end
    true
end

