=begin
Given an array of integers. Take that array and find an index N where the sum 
of the integers to the left of N is equal to the sum of integers to the right of
N. 

If there is no index that would make this happen, return -1.

example: with n array [1,2,3,4,3,2,1], the method will return index 3.
because at the 3rd position of the array, the sum of the left side of the index,
[1,2,3] and the sum of the right side of the index [3,2,1] both equal 6

example 2:
array = [20, 10, -80, 10, 10, 15, 35]
at index 0, the left side is empty
the right side is : [10,-80, 10, 10, 15, 35]
both are reual to 0 when added. empty arrays are equal to 0 in this problem.
index 0 is where the left and right side are equal.

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100, 50, -50, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


PROBLEM:
input = array of integers
output = integer that...

- is an index number N where..
  - the sum of integer to left of N == the sum of integer to the right of N
  
rules:
- return -1 if no such index exists for the given input array

examples:
find_even_index([1,100, 50, -50, 1, 1]) == 1

index 1 == 100
left side == [1]
right side == [50,-50,1,1]

data structure: array
alogorithm:
given an array of integers
- find total sum of elements in the array
- iterate through the array
- calculate total left sum starting at index 0
- calculate the right sum
  total sum - left sum - current element
- if left sum == total sum - left sum - current element (right sum)
  - return index number of that element
  - else return -1
  
  
  total - left = right
  but we need to exclude N..index number element because it doesn't 
  count for either left or right
  
  total - left - index number element = right
  right == left
  total - left - index number element == left


total_sum = 103
array = [1,100, 50, -50, 1, 1]

left_sum = 0
[1,100, 50, -50, 1, 1]

total_sum - left_sum - array[i] == left_sum
=end


    
def find_even_index(array)
  total_sum = array.reduce(:+)
  left_sum = 0
  array.each_with_index do |integer, index| 
    # alternative do array.each_with_index.reduce(0) 
    #do |left_sum, (integer, index)|...initialize leftum in reduce and the parameter
    return index if total_sum - left_sum - integer == left_sum
    left_sum += integer #if integer != 0
  end
  -1
end


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3