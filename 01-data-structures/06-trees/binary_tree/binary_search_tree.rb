require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating < node.rating && !root.right
      root.right = node
    elsif root.rating < node.rating && root.right
      insert(root.right, node)
    elsif root.rating > node.rating && !root.left
      root.left = node
    elsif root.rating > node.rating && root.left
      insert(root.left, node)
    end
  end 

  # Recursive Depth First Search
  def find(root, data)
    return nil if !root || data === nil
    return root if root.title === data
    if root.left && root.left.title === data
      return root.left
    elsif root.right && root.right.title === data
      return root.right
    elsif find(root.left, data)
      return find(root.left, data)
    elsif find(root.right, data)
      return find(root.right, data)
    end
  end

  def delete(root, data)
    return nil if !root || data === nil
    if root.title === data
      root = root.right
    else 
      node = find(root, data)
      node.title = nil
    end
  end

  def printf(children=nil)
    return nil if @root.nil?
    queue = Queue.new
    queue.enq(@root)
    while !queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" if !value.title.nil?
      # keep moving the levels in tree by pushing left and right nodes of tree in queue
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end
end

# root = Node.new("The Matrix", 87)
# tree = BinarySearchTree.new(root)

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


# tree.insert(root, hope)
# tree.insert(root, empire)
# tree.insert(root, jedi)
# tree.insert(root, martian)
# tree.insert(root, pacific_rim)
# tree.insert(root, inception)
# tree.insert(root, braveheart)
# tree.insert(root, shawshank)
# tree.insert(root, district)
# tree.insert(root, mad_max_2)
# tree.insert(root, donnie)

# tree.printf


