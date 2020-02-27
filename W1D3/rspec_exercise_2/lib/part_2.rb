def palindrome?(str)
    reversed = ''
    (str.length-1).downto(0).each do |n|
        reversed += str[n]
    end
    reversed == str
end

def substrings(string)
    subs = []
    string.each_char.with_index do |char1, i1| 
        string.each_char.with_index do |char2, i2| 
            subs << string[i1..i2] if i2 >= i1   
        end
    end
    subs
end

def palindrome_substrings(str)
    subs = substrings(str)
    subs.select { |sub| palindrome?(sub) && sub.length > 1 }
end