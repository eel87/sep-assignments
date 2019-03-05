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


# root = Node.new("The Matrix", 87)
# tree = BinaryHeap.new(root)

# braveheart = Node.new("Braveheart", 78) 
# jedi = Node.new("Star Wars: Return of the Jedi", 80) 
# donnie = Node.new("Donnie Darko", 19) 
# inception = Node.new("Inception", 86)
# district = Node.new("District 9", 90) 
# shawshank = Node.new("The Shawshank Redemption", 91) 
# martian = Node.new("The Martian", 92) 
# hope = Node.new("Star Wars: A New Hope", 93) 
# empire = Node.new("Star Wars: The Empire Strikes Back", 94) 
# mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)
# pacific_rim = Node.new("Pacific Rim", 72)


# tree.insert( hope)
# tree.insert( empire)
# tree.insert( jedi)
# tree.insert( martian)
# tree.insert( pacific_rim)
# tree.insert( inception)
# tree.insert( braveheart)
# tree.insert( shawshank)
# tree.insert( district)
# tree.insert( mad_max_2)
# tree.insert(donnie)

# tree.print

