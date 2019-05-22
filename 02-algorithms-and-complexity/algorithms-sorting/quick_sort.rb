def partition(collection, left_pointer, right_pointer, pivot)
	print "collection = #{collection}\n"
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

def quicksort(collection, left = 0, right = collection.length - 1)
	if left >= right
		return
	end
	pivot = collection[(left + right)/2].floor
	index = partition(collection, left, right, pivot)
	quicksort(collection, left, index - 1)
	quicksort(collection, index, right)
	return collection
end


collection = Array.new(15) { rand(0..300) }

print quicksort(collection)