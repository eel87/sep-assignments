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