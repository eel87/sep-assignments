require 'benchmark'

def fib_recursive(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return fib_recursive(n-1) + fib_recursive(n-2)
  end
end

def fib_iterative(n)
  fib_0 = 0
  fib_1 = 1
  (0..n-1).each do 
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end  
  return fib_0
end


Benchmark.bm(10) do |x|
  puts "fib(20) comparison:"
  x.report('iterative:') { fib_iterative(20) }
  x.report('recursive:') { fib_recursive(20) }
end
