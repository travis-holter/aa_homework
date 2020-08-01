def bad_two_sum?(arr, target)

    (0...arr.length).each do |i1|
        (i1...arr.length).each do |i2|
            return true if arr[i1] + arr[i2] == target && (i1 != i2)
        end
    end
    false
end

def okay_two_sum?(arr, target)
    sorted_arr = arr.sort
    mid_point = arr.length / 2 
    if sorted_arr[mid_point] + sorted_arr[mid_point + 1] == target
        return true
    elsif sorted_arr[mid_point] + sorted_arr[mid_point + 1] < target
        okay_two_sum?(sorted_arr[0...mid_point], target)
    else
        okay_two_sum?(sorted_arr[mid_point+1..-1], target)
    end
    false
end

# [0, 1, 2, 2, 3, 5, 7, 7, 8, 9], target = 6
#  i  j

def okay_two_sum?(arr, target)
    arr.sort!
    i = arr[0]
    j = arr[1]
    until i >= arr.length
        case (arr[i] + arr[j]) <=> target
        when 0
            return true
        when - 1
            j += 1
        when 1
            i += 1
            j = i + 1
        end
    end
    false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false