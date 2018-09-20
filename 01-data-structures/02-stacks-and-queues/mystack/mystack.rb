class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

	def push(element)
		index = @stack.length
		@stack[index] = element
		self.top = element
	end

  def pop
		item = @stack.last
	  @stack.delete(item)
		self.top = @stack.last
		return item
	end

  def empty?
    if @stack.length === 0
      return true
    else
      return false
    end
  end
end