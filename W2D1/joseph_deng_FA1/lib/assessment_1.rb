# Define your methods here.
def my_map!(array, &proc)
    array.each_with_index { |ele, idx| array[idx] = proc.call(ele)}
end

def two?(array, &proc)
    count = 0
    array.each { |ele| count += 1 if proc.call(ele)}
    count == 2
end

def nor_select(array, proc1, proc2)
    array.select { |ele| !proc1.call(ele) && !proc2.call(ele) }
end

def array_of_hash_sum(array)
    sum = 0
    array.each do |hash|
        hash.each { |k, v| sum += hash[k]}
    end
    sum
end

def slangify(sentence)
    voewls = 'aeiouAEIOU'
    result = []
    words = sentence.split(' ')
    words.each do |word|
        if !has_vowel?(word)
            result << word
        else
            word.each_char.with_index do |char, index|
                if voewls.include?(char)
                    result << word[0...index] + word[index+1..-1]
                    break
                end
            end
        end
    end
    result.join(' ')
end

def has_vowel?(word)
    voewls = 'aeiou'
    word.each_char { |char| return true if voewls.include?(char) }
    false
end

def char_counter(string, *args)
    hash = Hash.new(0)
    if (args.length == 0)
        string.each_char { |char| hash[char] += 1}
        return hash
    end

    
    args.each do |ele|
        string.each_char do |char|
            hash[char] += 1 if char == ele
        end
    end

    args.each { |ele| hash[ele] = 0 if !hash.has_key?(ele)}
    hash
end