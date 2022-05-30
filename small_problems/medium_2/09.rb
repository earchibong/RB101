=begin

9. Bubble Sort

Write a method that takes an Array as an argument, 
and sorts that Array using the bubble sort algorithm as just described. 
Note that your sort will be "in-place"; that is, 
you will mutate the Array passed as an argument. 
You may assume that the Array contains at least 2 elements.

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

Algorithm
- find the size of the array to determine how many times to iterate
- array has more than 2 elements.
  - return 'empty list' if array.size <= 1
- start loop
  - initialize variable 'swapped' to 'false'
  - to iterate, call times method on the array size
    - unless the current number is greater than the next, skip to next iteration
    - if current num is greater than the next, swap elements
  - reassign 'swapped' to 'true'
  - break loop unless index is sorted
=end

def bubble_sort!(array)
  return 'empty list' if array.size <= 1
  loop do
    swapped = false
    (array.size - 1).times do |num|
      if array[num] > array[num + 1]
        array[num], array[num + 1] = array[num + 1], array[num]
        swapped = true
      end
    end
    break unless swapped
  end
  array
end

array = [5, 3]
p bubble_sort!(array) == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array) == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)