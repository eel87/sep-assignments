class HashClass
	attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
		@items.map! { |item| item = HashItem.new(@key, @value) }		
  end

	def []=(key, value)
		index = index(key, size)
		if @items[index].value == value
			return @items[index].value
		elsif @items[index].key == key && @items[index].value != value
			resize
		else
			@items[index].key = key
			@items[index].value = value
			key = value
		end
	end
	
  def [](key)
		index =  index(key, @items.length)
		return @items[index].value
  end


  # Simple method to return the number of items in the hash
  def size
		return @items.count
  end

  def index(key, size)
    index = key.sum % size
    return index
  end
  
	def resize
		s = @items.length
		newItems = Array.new((s*2) - s)
		newItems.map! { |item| item = HashItem.new(@key, @value) }
		@items += newItems

		@items.each_with_index do |item, index|
			key = item.key
			value = item.value
			next if key == nil
			# puts "index is #{index}, key is #{key}, value is #{value}"
			index = index(key, @items.length)
			# puts "new indexis #{index}, key is #{key}, value is #{value}"
			@items[index].key = item.key
			@items[index].value = item.value
			key = item.key
			value = item.value
		end
	end
end
