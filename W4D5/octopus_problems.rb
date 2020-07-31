fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish(arr)
    arr.each do |ele1|
        return ele1 if arr.all? { |ele2| ele1.length >= ele2.length } 
    end
    nil
end

p sluggish(fish_arr)

def dominant(arr)
     (0...arr.length - 1).each do |i|
        if arr[i].length > arr[i + 1].length
            arr[i], arr[i+1] = arr[i+1], arr[i]
        end
    end
    arr.last
end

p dominant(fish_arr)

def clever(arr)
    biggest = nil
    biggest_len = 0
    arr.each do |ele|
        if ele.length > biggest_len
            biggest = ele
            biggest_len = ele.length
        end
    end
    biggest
end

p clever(fish_arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(target, arr)
    arr.each_with_index { |ele, i| return i if ele == target }
    nil
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

# new_tiles_data_structure = []

# I have to admit I am missing something and I don't know how to make
# a search algorithm in constant time. It seems like the lecture was talking
# about how to use the xor (^) operator to find a missing element, and I understand
# how that works, but it seems to me that you still have to itterate over the array
# thus making it linear... right? I am running on five hours of sleep and it's getting
# close to midnight so this is the best I have for now. I will look at the solutions
# tomorow morning. 
def constant_dance(target, arr)

end

