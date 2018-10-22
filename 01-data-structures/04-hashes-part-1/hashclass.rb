class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

	def []=(key, value)
		i = index(key, size)
		if @items[i] == nil
			@items[i] = HashItem.new(key, value)
		elsif @items[i].key == key
			@items[i].value = value
		else
			resize
			@items << HashItem.new(key, value)
			if @items[i] == nil
				@items[i] = HashItem.new(key, value)
			elsif @items[i].key == key
				@items[i].value = value
			else
				resize
			end
		end	
	end

  def [](key)
		i = index(key, size)
		return @items[i].value
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

  def index(key, size)
		index = key.sum % size
    return index
  end

  def size
		@items.count
  end
end