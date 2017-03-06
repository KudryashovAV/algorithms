class Sort
  def self.insertion_sort(arr, index = 1)
    return arr unless index < arr.size
    inherit_index = index
    while arr[inherit_index] < arr[inherit_index - 1] do
      arr.insert(inherit_index, arr.delete_at(inherit_index - 1))
      inherit_index -= 1
      break if inherit_index == 0
    end
    index += 1
    sort(arr, index)
  end
end
