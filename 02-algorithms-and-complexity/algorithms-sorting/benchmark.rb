require 'benchmark'
require_relative 'heap_sort'
require_relative 'quick_sort'
require_relative 'bucket_sort'

collection = Array.new(50) { rand(0..300) }
print collection
puts "\n"
Benchmark.bm do |x|
  x.report('quick_sort:') { quick_sort(collection) }
  x.report('heap_sort:') { heap_sort(collection) }
  x.report('bucket_sort:') { bucket_sort(collection) }
end