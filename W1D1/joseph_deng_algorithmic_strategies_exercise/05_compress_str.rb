# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".
def compress_str(str)
    output = ''
    pre = str[0]
    count = 0
    str.each_char do |ch|
        if ch == pre
            count += 1
        else
            if count == 1
                output += pre
            else
                output += count.to_s + pre
            end
            pre = ch
            count = 1
        end
    end
    if count == 1
        output += pre
    else 
        output += count.to_s + pre
    end
    return output
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
