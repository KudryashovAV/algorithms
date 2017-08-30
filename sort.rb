class Sort
  require 'benchmark'

  def self.insertion_sort(arr, index = 1)
    return arr unless index < arr.size
    inherit_index = index
    while arr[inherit_index] < arr[inherit_index - 1] do
      arr.insert(inherit_index, arr.delete_at(inherit_index - 1))
      inherit_index -= 1
      break if inherit_index == 0
    end
    index += 1
    insertion_sort(arr, index)
  end

  def self.qsort(arr)
    return arr if arr.length <= 1
    element = arr[0]
    hash = arr.group_by { |x| x < element }
    small  = hash[true] || []
    big = hash[false] || []
    big.delete(element)
    qsort(small) + [element] + qsort(big)
  end
end

ARR = [5, 10, -1, 121, 13, 1, 7]

Benchmark.bm do |x|
  x.report { p 'qsort'; p Sort.qsort(ARR) }
  x.report { p 'insertion_sort'; p Sort.insertion_sort(ARR) }
end
