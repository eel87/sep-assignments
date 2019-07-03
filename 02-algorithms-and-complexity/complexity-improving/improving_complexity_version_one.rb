def poorly_written_ruby(*arrays)
   array = *arrays.concat.flatten
   sorted_array = [array.delete_at(array.length-1)]

  array.each do |val|
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      end
      i+=1
    end
    
    if i == sorted_array.length
      sorted_array << val
    end
  end
  
  sorted_array
end


array1 = Array.new(3) { rand(0..300) }
array2 = Array.new(3) { rand(0..300) }
array3 = Array.new(3) { rand(0..300) }
print poorly_written_ruby(array1, array2, array3)