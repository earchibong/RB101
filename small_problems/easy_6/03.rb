=begin
Write a method that calculates and returns the index of the first Fibonacci 
number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Problem
input = integer

output = integer that
 - is the index of a fibonnaci number whose digits /  length == input integer
 


rules /examples
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

 
data structure = integer
algorithm
given an input integer
- initalise the first and second fibonacci numbers to 1 according to the series condition
- start an index count at 2 because we have the 2nd number in the series
- start a loop 
  - while the size of the 2nd number is less than the input number
    - the sequence would be : the first and second number equals the 2nd and 3rd 
      3rd number being is the sum of the previous 2 numbers in the sequence
    - increment the index by one
     - keep replacing the number with new pairs until conditionis reached
  - return index value
=end

def find_fibonacci_index_by_length(integer)
  a = 1
  b = 1
  index = 2
  
  while b.to_s.size < integer
    a , b = b, a + b
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847