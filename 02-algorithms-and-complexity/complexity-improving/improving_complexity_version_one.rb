def poorly_written_ruby(*arrays)
  array = arrays.concat.flatten
  sorted_array = [array.delete(array.last)]
  
  for val in array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
     i+=1
    end
  end
  
  sorted_array
end