def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1
    output = ""

    return word if word.split('').none? {|char| vowels.include?(char)}

    while i >= 0
       if !(vowels.include?(word[i]))
            output += word[i]
       else
            break
       end
       i -= 1
    end
    word[0...i] + output.reverse!
end

def vowel_counts(string)
    hash = Hash.new(0)
    vowels = 'aeiou'

    string.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    return hash
end


def caesar_cipher(message, num)
    alpha = "abcdefghijklmnopqrstuvwxyz"
    new_message = ""

    message.each_char do |char|
        if !alpha.include?(char)
            new_message += char
        else
            index = alpha.index(char)
            new_index = (index + num) % 26
            new_message += alpha[new_index]
        end
    end
    new_message
end

