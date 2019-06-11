def insertion_sort(collection)
sorted_collection = [collection.delete_at(0)]
	for val in collection
	sorted_collection_index = 0
	  while sorted_collection_index < sorted_collection.length
			if val <= sorted_collection[sorted_collection_index]
				sorted_collection.insert(sorted_collection_index, val)
				break
			elsif sorted_collection_index == sorted_collection.length - 1
				sorted_collection.insert(sorted_collection_index + 1, val)
				break
			end
	    sorted_collection_index += 1
	  end
	end
	return sorted_collection
end

def bucket_sort(array, bucket_size = 5)
	if array.empty?
		return
	end

	min_value = array.min
	max_value = array.max

	bucket_count = ((max_value - min_value) / bucket_size).floor + 1
	buckets = Array.new(bucket_count)
	(0..buckets.length - 1). each do |i|
		buckets[i] = []
	end

	(0..array.length - 1).each do |i|
		buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
	end

	array.clear
	buckets.each do |i|
		i = insertion_sort(i)
		i.each do |value|
			array.push(value)
		end
	end
	return array
end

# collection = Array.new(15) { rand(0..300) }
# print bucket_sort(collection)