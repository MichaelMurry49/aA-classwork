require 'byebug'

def anagram?(word1, word2)
  #O(n!)


  # array = []
  # word1.chars.each_with_index do |char, idx|
  #   word = word1[0...idx] + word1[idx+1..-1]
  #   word.length.times do 
  #     (0..word.length).each do |i|
  #       array << word[0...i] + char + word[i..-1]
  #     end
  #     debugger
  #     word = word.chars.rotate(1).join
  #   end
  # end
  # print array
  # array.include?(word2)

  find_anagrams(word1).include?([word2])
end


def find_anagrams(word)  #abc / bc /c
  return [[word]] if word.length == 1
  result = []
  output = []
  (0...word.length).each do |i|
    cur = word[i] #a / b
    rest = word[0...i] + word[i+1..-1]  #bc / c
    output = find_anagrams(rest) # [[cb]]
    output.map! do |ele|
      [ele.join("") + cur]
    end
    # p output
    result += output
  end
  result
end


#p anagram?("gizmo", "sally")  #false
# p anagram?("elvis", "lives")  #true

def second_anagram?(word1, word2)
  #O(n)
  word1.chars.each do |char|
    idx = word2.index(char)
    return false if idx == nil
    word2 = word2[0...idx] + word2[idx + 1..-1]
  end
  word2.length == 0
end

# p second_anagram?("gizmo", "sally")  #false
# p second_anagram?("elvis", "lives")  #true

def third_anagram?(word1, word2)
  #nlogn
  word1.chars.sort == word2.chars.sort 
end
# p third_anagram?("gizmo", "sally")  #false
# p third_anagram?("elvis", "lives")  #true

def fourth_anagram?(word1, word2)
  #O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  word1.each_char { |char| hash1[char] += 1 }
  word2.each_char { |char| hash2[char] += 1 }
  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")  #false
# p fourth_anagram?("elvis", "lives")  #true