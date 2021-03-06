require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

	def add_to_tail(node)
		if @head.nil?
			@head, @tail = node, node
	  else
	    current_node = @head
	    while current_node.next
	      current_node = current_node.next
	    end
	    current_node.next = node
	    @tail = node
		end
	end
  
  def remove_tail
    if @head === @tail
      @head, @tail = nil, nil
    else
      current_node = @head
      while current_node.next && @tail != current_node.next
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end
  
  def print
    current_node = @head
		puts current_node.data
    while current_node.next
      current_node = current_node.next
      puts "#{current_node.data}"
    end
  end

  def delete(node)
    current_node = @head
    while current_node.next
      if @head == node
        @head = @head.next
      elsif current_node.next == node
        current_node.next = node.next
      end
      current_node = current_node.next
      if @tail == node
        current_node.next = nil
        @tail = current_node
      end
    end
  end
  
  def add_to_front(node)
    node.next = @head
    @head = node
  end
  
  def remove_front
    temp = @head
    @head = @head.next
    return temp
  end
  
  def is_empty
    if !@head
      return true
    end
    false
  end 
  
  def print_nodes
    if !@head
      return 'no nodes'
    end
    list = []
    current_node = @head
    while current_node.next
      list << current_node
      current_node = current_node.next
    end
    list << current_node
    return list
  end 
  
  def count
    return 0 if self.is_empty
    current_node = @head
    total = 1
    while current_node.next
      total += 1
      current_node = current_node.next
    end
  return total
  end

end
