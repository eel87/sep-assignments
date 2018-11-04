require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
		if @items[i] == nil
			@items[i] = Node.new(key, value)
		# elsif @items[i].key == key
		# 	@items[i].value = value
		else
			resize
			i = index(key, size)
			while @items[i].next
				if @items[i].next == nil
					@items[i] = Node.new(key, value)
				# elsif @items[i].key == key
				# 	@items[i].value = value
				else
				  resize
				end
			end
		end
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
    if @items[index] == nil
      return index
    end
    while @items[index].next
				if @items[i].next == nil
				  return index
				else
				  return -1
				end
    end		
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.count
  end

  # Resize the hash
  def resize
		size = (@items.length*2)
		newItems = Array.new(size)
		
		@items.each_with_index do |item, index|
			next if item == nil
			newIndex = index(item.key, size)
			newItems[newIndex] = item
		end
	  @items.replace(newItems)
  end
  
end