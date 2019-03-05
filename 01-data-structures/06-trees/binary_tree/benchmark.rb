require 'benchmark'
require_relative 'node'
require_relative 'binary_search_tree'
require_relative 'binary_heap'

root = Node.new("The Matrix", 87)

heap = BinaryHeap.new(root)
tree = BinarySearchTree.new(root)

braveheart = Node.new("Braveheart", 78) 
jedi = Node.new("Star Wars: Return of the Jedi", 80) 
donnie = Node.new("Donnie Darko", 19) 
inception = Node.new("Inception", 86)
district = Node.new("District 9", 90) 
shawshank = Node.new("The Shawshank Redemption", 91) 
martian = Node.new("The Martian", 92) 
hope = Node.new("Star Wars: A New Hope", 93) 
empire = Node.new("Star Wars: The Empire Strikes Back", 94) 
mad_max_2 = Node.new("Mad Max 2: The Road Warrior", 98)
pacific_rim = Node.new("Pacific Rim", 72)

# Binary Search tree:
puts "Binary Search Tree build tree:"
puts Benchmark.measure {
    tree.insert(root, hope)
    tree.insert(root, empire)
    tree.insert(root, jedi)
    tree.insert(root, martian)
    tree.insert(root, pacific_rim)
    tree.insert(root, inception)
    tree.insert(root, braveheart)
    tree.insert(root, shawshank)
    tree.insert(root, district)
    tree.insert(root, mad_max_2)
    tree.insert(root, donnie)
}

# Binary Heap:
puts "Binary Heap build heap:"
puts Benchmark.measure {
    heap.insert(hope)
    heap.insert(empire)
    heap.insert(jedi)
    heap.insert(martian)
    heap.insert(pacific_rim)
    heap.insert(inception)
    heap.insert(braveheart)
    heap.insert(shawshank)
    heap.insert(district)
    heap.insert(mad_max_2)
    heap.insert(donnie)
}

puts "\nBinary Tree find node:"
puts Benchmark.measure {
    tree.find(root, district)
    tree.find(root, mad_max_2)
}

puts "\nBinary heap find node:"
puts Benchmark.measure {
    heap.find(district)
    heap.find(mad_max_2)
}
