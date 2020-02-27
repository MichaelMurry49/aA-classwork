def duos(string)
    count = 0
    i = 0
    while i < string.length - 1
        if string[i] == string[i + 1]
            count += 1
        end
        i += 1
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent,hash)
        arr=[]
    sent.split(" ").each do |word| 
            if hash[word]!=nil
                arr<<hash[word]
            else 
                arr<<word 
            end 

    end 
    return arr.join(' ')
end 

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, proc, &block)
    new_hash = {}
    hash.each do |k, v|
        new_hash[block.call(k)] = proc.call(v)
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(sent)
    hash=Hash.new(0)
    arr=[]
        sent.each_char do |char|
                hash[char]+=1
        end 
     hash.each do |k,v|
       if v>2
            arr<<k
     end
    end 
return arr
end 

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
    i = 0
    while i < string.length - 2
        if string[i] == string[i + 1] && string[i] == string[i + 2]
            return true
        end
        i += 1
    end
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str,hash)
    str1=""
        str.each_char do |char|

            if hash.has_key?(char)
                str1+=hash[char]
            elsif char==" "
                str1<<char
            else
                str1<<"?"
            end 

        end 
        return str1
end 
# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    str = ''
    string.each_char.with_index do |char, idx|
        if idx.even?
            num = string[idx + 1].to_i
            num.times do 
                str << char 
            end
        end
    end
    str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
def conjunct_select(arr,*proc)

        ind=0
            while ind<proc.length 
                arr.select! {|ele| proc[ind].call(ele)}
                ind+=1
            end 
     return arr

end 

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    words = sentence.split(' ')
    arr = []
    words.each do |word|
        if word.length < 3
            arr << word 
        else
            arr << transform(word)
        end
    end
    arr.join(' ')
end

def transform(word)
    vowels = 'aeiouAEIOU'
    if vowels.include?(word[0])
        return word + 'yay'
    else 
        word.each_char.with_index do |char, index|
            capitalized = word[0] == word[0].upcase
            if vowels.include?(char)
                if !capitalized
                    return word[index..-1] + word[0...index] + 'ay' 
                else 
                    return word[index].upcase + word[index-1..-1] + word[0...index] + 'ay' 
                end
            end
        end
    end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# def reverberate(sent)
#     words=sent.split(" ")
#     arr1=[]
#     words.each do |word|
#             if word.length<3
#                 arr1<< word
#             else arr1 << translate(word)
#             end 
#     end 
#     return arr.join(" ")

# end 
# def translate(word)
#     vol="aeiouAEIOU"
#     capitalized = word[0] == word[0].upcase
#     if vol.include?(word[-1])
#         return word+word
#     else 
#         reverse = word.reverse
#         word.each_char.with_index do |char,ind|
#             if vol.include?(char)
#                 if !capitalized
#                     return  reverse+word[0..ind].reverse
#                 else
#                     return word[0].upcase + word[1..-1]+reverse[0..ind].reverse
#             end 
#         end 

# end 

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# # p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr,*procs)
    new_arr = []
    arr.each do |ele|
        procs.each do |proc|
            if proc.call(ele)
                new_arr << ele
                break
            end 
       end
    end
       new_arr
end 

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
 
 arr1=[]
  arr=sent.split(" ")
  arr.each_with_index do |ele,idx|
    if idx.even?
            arr1<< from_begin(ele)
    else
        
        rev=from_begin(ele.reverse)
        arr1<<rev.reverse
    end 
end 
return arr1.join(" ")
end 
def from_begin(ele)
vol="aeiouAEIOU"
ele.each_char.with_index do |char,ind|
        if vol.include?(char)
            return ele[0...ind]+ele[ind+1..-1]
        end 
    
end 
return ele
end 

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    vowels = 'aeiouAEIOU'
    words = sentence.split(' ')
    arr = []
    words.each do |word|
        if vowels.include?(word[-1])
            arr << word + word[-1]
        else
            arr << change(word)
        end
    end
    arr.join(' ')
end

def change(word)
    vowels = 'aeiouAEIOU'
    str = ''
    capitalized = word[0] == word[0].upcase
    word.each_char.with_index do |char, index|
        if vowels.include?(char)
            str << char + 'b' + char 
        else
            str << char 
        end
    end
    if capitalized
           return  str.capitalize
    else 
            return str 
     end
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
new_str=""
i=0
count=1
    while i<str.length-1
            if str[i]==str[i+1]
                count+=1
            else 
                if count!=1
                        new_str+=str[i]+count.to_s
                    else 
                    new_str+=str[i]
                    
                    end 
                count=1
            end
  i+=1pry
    end 
    if count!=1
                        new_str+=str[i]+count.to_s
                    else 
                    new_str+=str[i]
                    
                    end 
return new_str
end 

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"