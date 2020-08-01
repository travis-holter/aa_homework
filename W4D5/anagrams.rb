def first_anagram?(str1, str2)

    arr = str1.split("").permutation.to_a
    arr.map! {|ele| ele.join("")}
    arr.include?(str2)


end

def second_anagram?(str1, str2)
    str1.each_char do |char|
        if str2.index(char)
            idx = str2.index(char)
            str2[idx] = ""
        else
            return false
        end
    end
    return true if str2.length == 0
end

def third_anagram?(str1, str2)
    word1 = str1.split("").sort!
    word2 = str2.split("").sort!
    word1 == word2
end

def fourth_anagram?(str1, str2)
    hash1 = Hash.new { |h,k| h[k] = 0 }
    str1.each_char { |char| hash1[char] += 1 }
    str2.each_char { |char| hash1[char] -= 1 }
    hash1.each do |k,v|
        return false if hash1[k] != 0
    end
    true
end


p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true