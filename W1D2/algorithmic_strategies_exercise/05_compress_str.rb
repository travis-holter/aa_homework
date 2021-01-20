# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

require 'byebug'

def compress_str(string)
    # debugger
    last_char = ''
    streak = 0
    result = ''
    (0..string.length).each do |i|
        if i == 0 
            last_char = string[i]
            streak = 1
            next
        end
        if string[i] == last_char
            streak += 1
        end
        if string[i] != last_char
            result += streak.to_s if streak > 1
            result += last_char
            last_char = string[i]
            streak = 1
        end
    end
    result
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
