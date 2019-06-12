# Write a Ruby method that takes a number n. 
# This method must print the worst-case number of iterations for linear search to find an item in collections of size one to n. 
# Use it to generate a table of worst-case iterations of collections up to size 1.


def linear(n)
  print "\nLinear Search worst case number of iterations:\n"
  (1..n).each do |number|
    print "\nn = #{number} | iterations = #{number}"
  end
end

linear(10)