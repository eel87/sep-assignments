require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
	attr_reader :items

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    i = index(key, size)
    if @items[i] == nil
      @items[i] = LinkedList.new
      @items[i].head = Node.new(key, value)
    else
      @items[i].add_to_tail(Node.new(key, value))
    end
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    i = index(key, size)
    if @items[i].head
      current_node = @items[i].head
      if key == current_node.key
        return current_node.value
      end
      while current_node.next
        if key == current_node.key
          return current_node.value
        end
        current_node = current_node.next
      end
    end
  end

  def index(key, size)
    index = key.sum % size
    return index
  end
  
  def load_factor
    counter = 0
    @items.each do |item|
			if item != nil
				current_node = item.head
				counter += 1
					while current_node == nil || current_node.next
						counter += 1
						current_node = current_node.next
					end
			end
    end
    load_factor = counter.to_f / @items.count.to_f
    return load_factor.to_f
  end

  def size
    return @items.count
  end

  def resize
  	size = (@items.length*2)
  	newItems = Array.new(size)
  
  	@items.each do |item|
  		next if item == nil
  		current_node = item.head
  		puts current_node.key
  		newIndex = index(current_node.key, size)
  		puts newIndex
  			if newItems[newIndex] != nil
  				newItems[newIndex].add_to_front(current_node)
  			else
  				newItems[newIndex] = LinkedList.new
  				newItems[newIndex].head = current_node
  			end
  		  current_node = current_node.next
  	end
  	@items.replace(newItems)
  end
end