class Map

    def initialize
        @arr = []
    end

    def set(key, value)
        allready_there = false
        @arr.each do |pair|
            if pair[0] == key
                pair[1] = value
                allready_there = true
                break
            end
            
        end
        @arr << [key, value] if !allready_there
    end

   def get(key)
    @arr.each do |pair|
        p pair if pair[0] == key
    end
   end

   def delete(key)
    delete_index = nil
    @arr.each_with_index do |pair, i|
        delete_index = i if pair[0] == key
    end
    @arr.delete_at(delete_index)
   end

   def show
    p @arr
   end

end 