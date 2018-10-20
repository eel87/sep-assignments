class HashClass
	attr_accessor :items

  def initialize(size)
    @items = Array.new(size)
		@items.map! { |item| item = HashItem.new(@key, @value) }		
  end

 def []=(key, value)
		index = index(key, size)
		@items[index].key = key
		@items[index].value = value
		key = value
  	# if @items[index].eql?(nil)
  	#   @items[index] = @items[index[1]]
		# elsif @items[index].eql?(@items[index[1]])
		# 	return @items[index[1]]
  	# else
  	# 	resize 
  	# 	# @items.each_with_index do |item, index|
				
		# 	# end
		# end
 end

  def [](key)
		index =  index(key, @items.length)
		return @items[index]
  end


  # Simple method to return the number of items in the hash
  def size
		return @items.count
  end

  def index(key, size)
    index = key.sum % size
  end
  
  def resize
		s = @items.length
		newItems = Array.new((s*2) - s)
		newItems.map! { |item| item = HashItem.new(@key, @value) }
		@items += newItems
	end
end