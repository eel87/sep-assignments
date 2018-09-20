class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    index = @queue.length
    @queue[index] = element
    @tail = @queue.last
    @head = @queue[0]
  end

  def dequeue
    temp = @head
    @queue.delete(temp)
    @tail = @queue.last
    @head = @queue[0]
    return temp
  end

  def empty?
    if @queue.length === 0
      return true
    else
      return false
    end
  end
end