def binary_search_recursive(collection, value)
  low = 0
  high = collection.length-1
  if low >= high
    return "no value found"
  end
  mid = (low + high) / 2
  if collection[mid] == value
    return mid
  elsif collection[mid] < value
    binary_search_recursive(collection[(mid + 1)..high], value)
  else
    binary_search_recursive(collection[low..mid], value)
  end
end

