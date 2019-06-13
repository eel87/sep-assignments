# Version one: O(log n). This algorithms is an iterative search, and therefore executes in O(log n) time.

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


# Version Two: O(2^n). With two recursive calls, this algorithms executes in O(2^n) time.

def partition(collection, left_pointer, right_pointer, pivot)
  while left_pointer <= right_pointer
    while collection[left_pointer] < pivot
      left_pointer += 1
    end
    while collection[right_pointer] > pivot
      right_pointer -= 1
    end
    if left_pointer <= right_pointer
      collection[left_pointer], collection[right_pointer] = collection[right_pointer], collection[left_pointer]
      left_pointer += 1
      right_pointer -= 1
    end
  end
  return left_pointer
end

def quick_sort(collection, left = 0, right = collection.length - 1)
	if left >= right
		return
	end
	pivot = collection[(left + right)/2].floor
	index = partition(collection, left, right, pivot)
	quick_sort(collection, left, index - 1)
	quick_sort(collection, index, right)
	return collection 
end

def poorly_written_ruby(*arrays)
	arrays = *arrays.concat.flatten
	quick_sort(arrays)
	return arrays
end

# Version three: O(2^n). This data structure will save space, but not time. With two recursive calls, this algorithms executes in O(2^n) time.

class MyArray
	def initialize(*arrays)
		@array = *arrays.concat.flatten
	end

	def partition(array, left_pointer, right_pointer, pivot)
		while left_pointer <= right_pointer
			while array[left_pointer] < pivot
				left_pointer += 1
			end
			while array[right_pointer] > pivot
				right_pointer -= 1
			end
			if left_pointer <= right_pointer
				array[left_pointer], array[right_pointer] = array[right_pointer], array[left_pointer]
				left_pointer += 1
				right_pointer -= 1
			end
		end
		return left_pointer
	end

	def quick_sort(array = @array, left = 0, right = array.length - 1)
		if left >= right
			return
		end
		pivot = array[(left + right)/2].floor
		index = partition(array, left, right, pivot)
		quick_sort(array, left, index - 1)
		quick_sort(array, index, right)
		return array 
	end
end