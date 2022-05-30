=begin
Halvsies
Write a method that takes an Array as an argument, and returns two Arrays 
(as a pair of nested Arrays) that contain the first half and second half of 
the original Array, respectively. 
If the original array contains an odd number of elements, 
the middle element should be placed in the first half Array.

Problem
input = array

output = 2 arrays that are 
 - nested: first and 2nd half of input array

rules / examples:
- if input array has an odd size
 - middle element should be in first half array
 
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]


 
data structure = array

algorithm
given an array
- deterime the size of the array
- determine the mid point: 
  - divide the the length of the array..
    - by 2.0 to return the precise value
    - then round it up to allow for odd sized array length
- get first half of the array
  - slice the array from the start of the array to the middle
- get the second half of the array
  - slice the array from the middle to the end
    - the end of the array is (array length - middle point)
- return both arrays in another array

      


  
=end


def halvsies(array)
  length = array.size
  middle = (length / 2.0).ceil
  first = array.slice(0, middle)
  second = array.slice(middle, length - middle)
  [first,second]
end



p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

