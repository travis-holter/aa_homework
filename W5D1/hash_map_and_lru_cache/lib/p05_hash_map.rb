require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  attr_reader :store
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      self.count += 1
      resize! if self.count == @store.length
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      self.count -= 1
    end
  end

  def each
    @store.each do |list|
      list.each do |node|
        yield [node.key, node.val]
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    copy_list = HashMap.new(@store.length * 2)
    self.count = 0
    @store.each do |list|
      list.each do |node|
        copy_list.set(node.key,node.val)
      end
    end
    @store = copy_list.store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % @store.length]
  end
end
