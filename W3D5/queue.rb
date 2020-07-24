class Queue

    def initialize
        @arr = []
    end

    def enqueue(el)
        @arr.unshift(el)
    end

    def dequeue
        @arr.pop
    end

    def peek
        @arr[-1]
    end

end