class Stack

    def initialize
        @arr = []
    end

    def push(el)
        @arr.push(el)
    end

    def pop
        @arr.pop
    end

    def peek
        @arr[-1]
    end

end