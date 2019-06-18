def better_sort(*arrays)
  array = *arrays.concat.flatten
  merge_sort(array)
end

def merge_sort(array)
  # split array
  if array.length <= 1
    array
  else
    middle = (array.length / 2).floor
    left = merge_sort(array[0..middle - 1])
    right = merge_sort(array[middle..array.length])
    merge(left,right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left[0] < right[0]
    [left[0]] + merge(left[1..left.length], right)
  else
    [right[0]] + merge(left, right[1..right.length])
  end
end

# print merge_sort([8,9,5,6])
print better_sort([0,7,5,4],[3,3,7,1],[2,7,5,4])