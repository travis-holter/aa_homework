
class Array

    def my_uniq
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash.select {|k,v| v >= 1}.keys
    end

    def two_sum
        result_array = []
        (0...self.length).each do |i1|
            (i1...self.length).each do |i2|
                result_array << [i1,i2] if self[i1] + self[i2] == 0 && i2 > i1
            end
        end
        result_array        
    end
    # iterate through the first column and make it the first row
    def my_transpose
        self.each do |row|
            raise ArgumentError if !row.is_a?(Array)
        end
        my_grid = []
        (0...length).each do |i|
            temp_arr = []    
            self.each do |row|
                temp_arr << row[i]
            end
            my_grid << temp_arr
        end
        my_grid
    end

    def stock_picker
        # grab the numbers that have the highest difference (1st - 2nd) * -1
        self.each { |ele| raise ArgumentError if !ele.is_a?(Integer) }
        picked = []
        biggest = 0
        self.each_with_index do |ele1, i1|
            self.each_with_index do |ele2, i2|
                if (i2 > i1) && (ele2 - ele1 > biggest)
                    picked = [i1,i2]
                    biggest = ele2 - ele1
                end
            end
        end
        picked
    end

end

class Hanoi

    attr_accessor :stack_1, :stack_2, :stack_3
    def initialize
        @stack_1 = [4,3,2,1]
        @stack_2 = []
        @stack_3 = []
    end

    def move(before,after)
        # until self.won?
        #     print "choose two towers to move a piece from [before, after]"
        #     input = gets.chomp
        #     before = input[0]
        #     after = input[1]

        #     if before.last.nil?
        #         raise "There isn't a piece to move"
        #         retry
        #     end
            return "I can't do that" if before.last.nil?
            return "I can't do that" if !(after.last.nil? || before.last < after.last)     
            after.push(before.pop)
        # end
    end

    def won?
        self.stack_1.empty? && self.stack_2.empty? 
    end
end