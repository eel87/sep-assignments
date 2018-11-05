require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end
  
  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
			@items[i] = Node.new(key, value)
		elsif @items[i].key == key
			@items[i].value = value
		elsif next_open_index(i) != -1
			index = next_open_index(i)
			@items[index] = Node.new(key, value)
		else
			resize
			i = index(key, size)
			if next_open_index(i) != -1
				index = next_open_index(i)
				@items[index] = Node.new(key, value)
			end
		end
  end
  
	# def []=(key, value)
 #   i = index(key, size)
 #   if @items[i] == nil
	# 		@items[i] = Node.new(key, value)
	# 	end
 #   while @items[i] != nil
 #   	if @items[i].key == key
	# 			@items[i].value = value
	# 		elsif next_open_index(i) != -1
	# 			@items[next_open_index(i)] = Node.new(key, value)
	# 		else
	# 			resize
	# 			i = index(key, size)
	# 			@items[i] = Node.new(key, value)
	# 		end
 #   end
	# end
	
  def [](key)
    i = index(key, size)
		return @items[i].value
  end

  def index(key, size)
    index = key.sum % size
    return index
  end
 
  def next_open_index(index)
    if @items[index] == nil
      return index
    end
    while @items[index].next
			if @items[index].next == nil
			  return index
			end
    end
    return -1
  end

  def size
    return @items.count
  end

  def resize
		size = (@items.length*2)
		newItems = Array.new(size)
		
		@items.each_with_index do |item, index|
			next if item == nil
			newIndex = index(item.key, size)
			newItems[newIndex] = item
		end
	  @items = newItems
  end
  
end