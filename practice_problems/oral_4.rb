=begin
The maximum sum subarray problem consists in finding the maximum sum of a 
contiguos sub sequence in an array of integers

maxsequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
should be 6: [ 4, -1, 2, 1]

easy case is when the array is made up of only positive numbers and the 
maximum sum of the whole array. If the array is made up of only negative
numbers, return 0 instead.

Empty array is considerd to have zero greatest sum. Empty array is also a valid
sub array

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1,-7, 4, -10, 2, 1, 5, 4]) == 12

note: 

con·tig·u·ous/kənˈtigyo͞oəs/Adjective
1. Sharing a common border; touching.
2. Next or together in sequence. 


Contiguos sub sequence :
elements in a sub sequence are called contiguos if the elements taken in order
are consecutive in the original set.

original sequence: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
contiguos sub sequence = [ 4, -1, 2, 1] because these elements follow each other
in the main sequence.

Problem:
input: array
output: integer that
  - is the sum of the sub-array that contains elements that follow each other 
   in the exact pattern in the main array
  
Rules:
 - when array is made up of positive numbers, then the maximum sum of the subarray is
 sum of the whole array
 - if array is only negtive numbers retun 0
 - if array is empty retun 0
 - empty arrays are valid sub arrays
 
 Data structure:
 array
 
 Alogrithm:
 Given an array...
 - find all sub-arrays of the given array
 - select the largest sub array from all possible subarrays that will give 
 the maximum possible sum
 - get the sum of the elements in the selected sub array
   - if sub array is empty: return 0
   - if elements of subarray are only positive numbers...
     - get the sum of elements the input array
  - if elements of subarray are only negative numbers: return 0


=end

def leading_sub(array)
  result = []
  0.upto(array.size - 1) do |index|
    result << array[0..index]
  end
  result
end

def subarrays(array)
  result = []
  0.upto(array.size) do |index|
    subs = array[index..-1]
    result.concat(leading_sub(subs))
  end
  result
end

def max_sub_array(array)
  all_subs = subarrays(array)
  all_subs.max_by { |subarray| subarray.sum }
end

def max_sequence(array)
  sub_array = max_sub_array(array)
  sum = 0
  if array.all? { |ele| ele < 0 } || array.empty?
    return 0
  elsif array.all? { |ele| ele > 0 }
    return array.sum
  end
  sub_array.each { |element| sum += element }
  sum
end

  

#p max_sub_array([-32])
p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1,-7, 4, -10, 2, 1, 5, 4]) == 12
    
    
