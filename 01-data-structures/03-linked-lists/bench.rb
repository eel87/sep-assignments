require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

#Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.

a = []

puts Benchmark.measure {
  10000.times do |i|
    a << i
  end
}

l = LinkedList.new

puts Benchmark.measure {
  10000.times do |i|
    n = Node.new(i)
    l.add_to_tail(n)
  end
}

#Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.

puts Benchmark.measure {
  a.fetch(5000)
}

nextNode = l.head.next

puts Benchmark.measure {
  5_000.times do
    nextNode = nextNode.next
  end
}

# Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
# In the Array, the 5001st item becomes the 5000th, and so on.

puts Benchmark.measure {
  a.delete_at(5000)
}
  
puts Benchmark.measure {
  l.delete(nextNode)
}