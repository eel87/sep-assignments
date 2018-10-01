require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

#Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.

array = Array.new(10000) {rand 1000}
list = LinkedList.new

10_000.times do
  list.add_to_tail(Node.new(rand 1000))
end

puts Benchmark.measure {
  puts "array"
  array
}

puts Benchmark.measure {
  puts "list"
  list
}

#Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.

findArrayElement = array.fetch(5000)

puts Benchmark.measure {
  puts "array"
  findArrayElement
}

puts Benchmark.measure {
  puts "list"
  nextNode = list.head.next
  5_000.times do
    nextNode = nextNode.next
  end
}

# Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
# In the Array, the 5001st item becomes the 5000th, and so on.

deleteArrayElement = array.delete_at(5000)

puts Benchmark.measure {
  puts "array"
  deleteArrayElement
}

puts Benchmark.measure {
  puts "list"
  nextNode = list.head.next
  5.times do
    nextNode = nextNode.next
  end
  list.delete(nextNode)
}