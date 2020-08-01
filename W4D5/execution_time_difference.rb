# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
require "byebug"

def my_min(arr)
    arr.each do |ele|
        return ele if arr.all? {|num| ele <= num}
    end
end

# p my_min(list) # =>5

# def my_min_2(arr)
#     min = 0
#     arr.each do |ele|
#         min = ele if ele < min
#     end
#     min
# end

# p my_min_2(list)

# def largest_contiguous_sum(arr)
#     subarrays = []
#     (0...arr.length).each do |idx1|
#         (idx1...arr.length).each do |idx2|
#             subarrays << arr[idx1..idx2]
#         end
#     end
#     largest = subarrays[1].sum
#     subarrays.each { |subarray| largest = subarray.sum if subarray.sum > largest}
#     largest
# end


# def largest_contiguous_sum(arr)
#     current_sum = 0
#     biggest_sum = 0

#     i = 0
#     while i < arr.length do
#         if current_sum + arr[i] > current_sum
#             current_sum += arr[i]
#             i += 1
#             biggest_sum = current_sum if current_sum > biggest_sum 
#         else
#             current_sum = 0
#             i += 2
#         end
#     end
#     biggest_sum

#     # # subarrays = []
#     # # i = arr.length - 1
#     # # while i >= 0 
#     # #     subarrays << [arr[i]]
#     # #     i -= 1
#     # # end 

#     # largest_sum = arr[0]
#     # i = 0
#     # j = 0
#     # while i < arr.length
#     #     current_sum = arr[i]
#     #     largest_sum = current_sum if current_sum > largest_sum
#     #     current_sum = arr[i..j].sum
#     #     largest_sum = current_sum if current_sum > largest_sum
#     #     if j == arr.length - 1
#     #         i += 1
#     #         j = 1
#     #     end
#     #     j += 1
#     # end
#     # largest_sum
# end

def largest_contiguous_sum(arr)
    debugger
    biggest_sum = arr[0]
    current_sum = 0
    arr.each do |ele|
        current_sum += ele
        if ele > current_sum
            # biggest_sum = ele
            current_sum = ele
        end
        biggest_sum = current_sum if current_sum > biggest_sum
    end
    biggest_sum
end

# Example 1

list = [5, 3, -7]
p largest_contiguous_sum(list) # => 8

# Example 2

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_sum(list) # => 8 (from [7, -6, 7])

# Example 3

list = [-5, -1, -3]
p largest_contiguous_sum(list) # => -1 (from [-1])


# his example [2,3,-6,7,-6,7]
# his example 2 [2,3,-6,3,4,-6,7]

