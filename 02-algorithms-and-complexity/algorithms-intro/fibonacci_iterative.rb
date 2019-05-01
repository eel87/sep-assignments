def fib(n)
  fib_0 = 0
  fib_1 = 1
  (0..n-1).each do 
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end  
  return fib_0
end

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
puts fib(10)
puts fib(11)
puts fib(12)
puts fib(13)
