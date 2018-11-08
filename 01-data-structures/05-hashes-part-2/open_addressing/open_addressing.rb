require_relative 'node'

class OpenAddressing
	attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
  end

	def []=(key, value)
		i = index(key, size)
		if @items[i] == nil
			@items[i] = Node.new(key, value)
		elsif @items[i].key == key
			@items[i].value = value
		elsif @items[i] != nil && @items[i] != key
			openIndex = next_open_index(i)
			if openIndex != -1
				@items[openIndex] = Node.new(key, value)
			else
				resize
				i = index(key, size)
			end
		end
	end

	def [](key)
	i = index(key, size)
		if @items[i].key == key
			return @items[i].value
		else
			@items.each_with_index do |item, index|
				if item.key == key
					return item.value
				else
					index += 1
				end
			end
		end
	end

  def index(key, size)
    index = key.sum % size
    return index
  end

	def next_open_index(index)
		@items.each_with_index do |item, i|
			if @items[i] == nil
				return i
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
	  @items.replace(newItems)
  end
end