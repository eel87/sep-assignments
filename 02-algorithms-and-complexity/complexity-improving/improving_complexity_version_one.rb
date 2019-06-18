def poorly_written_ruby(*arrays)
  array = arrays.concat.flatten
  sorted_array = [array.delete(array.last)]
  
  for val in array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      else
        sorted_array << val
        break
      end
      i+=1
    end
  end
  
  return sorted_array
end

print poorly_written_ruby([4,3,5],[9,0,7],[6,0,99,8])