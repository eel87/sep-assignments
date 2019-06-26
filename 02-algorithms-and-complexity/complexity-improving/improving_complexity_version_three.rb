class MyArray

  def initialize(*arrays)
    @array = *arrays.concat.flatten
  end
  
  def sort
    n = @array.length - 1
      begin 
      swapped = false
        n.times do |index|
          next if @array[index] == nil
          if @array[index] > @array[index + 1]
            temp = @array[index]
            @array[index] = @array[index + 1]
            @array[index + 1] = temp
            swapped = true
          end
        end
      end until not swapped
   @array
  end
end


array1 = Array.new(3) { rand(0..300) }
array2 = Array.new(3) { rand(0..300) }
array3 = Array.new(3) { rand(0..300) }
a = MyArray.new(array1, array2, array3)


print a.sort