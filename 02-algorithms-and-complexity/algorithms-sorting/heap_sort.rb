# I was originally working on implementing heapsort similar to how I did it in the trees section of data-structures:

def heapsort(collection)
	collection.each_with_index do |element, i|
		leftChild = collection[2*i]
		rightChild = collection[2*i + 1]
		next if element == nil
		if leftChild == nil && rightChild == nil
			break
		elsif element > leftChild && rightChild == nil
			leftChild, element = element, leftChild
		elsif element > leftChild && leftChild <= rightChild
			leftChild, element = element, leftChild
		elsif element > leftChild && element > rightChild && leftChild >= rightChild
			element, rightChild = rightChild, element
		elsif element < leftChild && rightChild == nil
			break
		elsif element < leftChild && element > rightChild
			element, rightChild = rightChild, element
		end
	end
	return collection
end
# When this was not working (I  had many versions of this code), I did a lot of googling and that's when I found this simple ruby method:

def heap_sort(array)
	n = array.length - 1
	a = array
  
  (n/2).downto(0) do |i|
		create_max_heap(a, i, n)
	end

  while n > 0
    a[0], a[n] = a[n], a[0]
    n -= 1
    create_max_heap(a, 0, n)
  end
  a
end

def create_max_heap(array, parent, limit)
  root = array[parent]
	while (child = 2 * parent) <= limit do 
		child += 1 if child < limit && array[child] < array[child + 1]
		break if root >= array[child]
		array[parent], parent = array[child], child
	end
	array[parent] = root
end


# collection = Array.new(15) { rand(0..300) }
# print heap_sort(collection)