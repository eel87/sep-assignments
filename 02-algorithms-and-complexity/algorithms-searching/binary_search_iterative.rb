def binary_search(collection, value)
  low = 0
  high = collection.length-1
  while low <= high
    mid = (low + high)/2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return "item is at index #{mid}"
    end
  end
  return "value not found"
end


puts binary_search([1,3,6,8,9], 3)
puts binary_search([1,3,6,8,9], 7)