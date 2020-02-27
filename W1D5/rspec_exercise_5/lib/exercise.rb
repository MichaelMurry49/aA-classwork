def zip(*arrays)
    output = [] #[[1,a]]
    (0...arrays[0].length).each do |i| #[[1,2,3,4], [a,b,c]] 
        temp = [] #[1, a]
        arrays.each_with_index do |num, j|
            temp << arrays[j][i]
        end
        output << temp
    end
    output
end

def prizz_proc(arr,proc1,proc2)
out=[]
    arr.each do |ele|
            if (proc1.call(ele) && !proc2.call(ele)) || (!proc1.call(ele)&& proc2.call(ele))
                out<<ele
            end 
    end 
    return out
end 

def zany_zip(*arrays)
    len = 0
    arrays.each { |arr| len = [len, arr.length].max }
    output = [] #[[1,a]]
    (0...len).each do |i| #[[1,2,3], [a,b,c]]
        temp = [] #[1, a]
        arrays.each_with_index do |num, j|
            temp << arrays[j][i]
        end
        output << temp
    end
    output
end

def maximum(array, &proc)
    max_val = 0
    n1=0
    return nil if array.length == 0
    array.each_with_index do |num, idx|
        if max_val <= proc.call(num)
            max_val = proc.call(num)
            n1=num
        end
    end
    return n1
end

def my_group_by(arr,&proc)
  hash = Hash.new { |hash, key| hash[key] = [] }
  arr.each do |ele|
    k=proc.call(ele)
    # if hash[k] == nil
    #     hash[k] = [ele] 
    # else 
        hash[k] << ele
    # end
  end 
  return hash
end 

def max_tie_breaker(array, proc, &bloc)
    return nil if array.length == 0
    ties = []
    largest = -1
    array.each { |ele| largest = bloc.call(ele) if bloc.call(ele) > largest }
    array.each { |ele| ties << ele if bloc.call(ele) == largest }
    return ties[0] if ties.length == 1

    largest = -1
    largestItem = nil
    ties.each do |ele| 
        if proc.call(ele) > largest 
            largest = proc.call(ele) 
            largestItem = ele
        end 
    end
    largestItem
end

def silly_syllables(sentence) #properly precisely written code - ope ecise itte ode"
    words = sentence.split(' ') #ylrep ylesice nettir edoc"
    arr = []
    words.each do |word|
        arr << vowel_remover(word)
    end
    arr.join(' ')
end

def vowel_remover(word) #written - itte
    #return word if word has less than 2 vowels
    vowels = 'aeiouAEIOU'
    vowel_count = 0
    word.each_char { |char| vowel_count += 1 if vowels.include?(char)}
    return word if vowel_count < 2
    new_word = ''
    new_word1=""
    word.each_char.with_index do |char, index|
        if vowels.include?(char)
            new_word = word[index..-1]
            break
        end
    end
    new_word.reverse!
    new_word.each_char.with_index do |char, index|
        if vowels.include?(char)
            new_word1 = new_word[index..-1]
            return new_word1.reverse
        end
    end
    
end