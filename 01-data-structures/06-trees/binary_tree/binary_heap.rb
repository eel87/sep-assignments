require_relative 'node'

class BinaryHeap
	attr_accessor :root
	attr_accessor :heap
	
	def initialize(root)
	  @root = root
		@heap = [nil, root]
	end

	def insert(node)
		@heap.push(node)
		sort
	end

	def swapLeft(i)
		temp = @heap[i]
		leftTemp = @heap[2*i]
		@heap[i] = leftTemp
		@heap[2*i] = temp
	end

	def swapRight(i)
		temp = @heap[i]
		rightTemp = @heap[i*2 + 1]
		@heap[i] = rightTemp
		@heap[i*2 + 1] = temp
	end

	def sort
	  @heap.each_with_index do |node, i|
			leftChild = @heap[2*i]
			rightChild = @heap[2*i + 1]
			next if node == nil
			if leftChild == nil && rightChild == nil
				break
			elsif node.rating > leftChild.rating && rightChild == nil
				swapLeft(i)
			elsif node.rating > leftChild.rating && leftChild.rating <= rightChild.rating
			 	swapLeft(i)
			elsif node.rating > leftChild.rating && node.rating > rightChild.rating && leftChild.rating >= rightChild.rating
				swapRight(i)
			elsif node.rating < leftChild.rating && rightChild == nil
				break
			elsif node.rating < leftChild.rating && node.rating > rightChild.rating
				swapRight(i)
			end
			@root = @heap[1]
  	end
	end

  def find(node)
    @heap.each do |i|
      next if i == nil
      if node == i.title
        return "#{i.title}"
      end
    end
		return nil
  end
  
  def delete(node)
    return if node == nil
	  @heap.each do |i|
      next if i == nil
      if node == i.title
        @heap.delete(i)
      end
    end
  end
  
  def print
    @heap.each do |node|
			next if node == nil
      puts "#{node.title}, #{node.rating}\n"
    end
  end 

end


