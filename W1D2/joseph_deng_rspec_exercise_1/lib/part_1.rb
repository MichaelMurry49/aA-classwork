def average(num1, num2)
    sum = num1 + num2
    sum / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
    repeated = ''
    while num > 0
        repeated += str
        num -= 1
    end
    repeated
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(string)
    alt = string.split.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else 
            word.downcase
        end
    end
    alt.join(' ')
end