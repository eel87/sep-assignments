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
			i = index(key, size)
			while @items[i] != nil && @items[i].key != key
				resize
				i = index(key, size)
			end
				if @items[i] == nil
					@items[i] = HashItem.new(key, value)
				elsif @items[i].key == key
				@items[i].value = value
				end
		end	
	end
	
	def [](key)
		i = index(key, size)
		if @items[i].key == key
			return @items[i].value
		elsif @items[i] == nil
			return nil
		else
			until @items[i].key == key
				i =+ 1
			end
				return @items[i].value
		end
	end
	
	def resize
		newItems = Array.new(size*2)
		
		# @items.each_with_index do |linkedList, index|
		# 	next if linkedList == nil 
		# 	if linkedList.head
		# 		current_node = linkedList.head
		# 		newIndex = index(current_node.key, size)
		# 		newItems[newIndex] = current_node
		# 		while current_node.next
		# 			current_node = current_node.next
		# 			newIndex = index(current_node.key, size)
		# 			newItems[newIndex] = linkedList.current_node
		# 		end
		# 	end
		# end
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