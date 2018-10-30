require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
  end

  def [](key)
    i = index(key, size)
		return @items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    index = key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.count
  end

  # Resize the hash
  def resize
  end
end