=begin
create a method that takes a positive integer number and returns the next
bigger number formed by the same digit

12 -> 21
513 -> 531
2017 -> 2071

if no bigger number can be created using these digits return -1:

9 -> -1
111 -> -1
531 -> -1

PROBLEM:
input : positive integer

output: integer that...

  - returns the next bigger number using the digits from the input integer
  
rules:
- return -1 if not possible to return next bigger number

data structure: array

alogrithm:
give an integer
- change the integer to an array and rotate the last 2 elements of the integer
- if rotated integer is less than the input integer return - 1
- if rotated intger is equal to input integer return - 1
  
=end

  
def rotate_last_n(integer)
  array = integer.to_s.chars
  if array.size < 2
    array
  else
    array[-2], array[-1] = array[-1], array[-2]
  end
  array.join.to_i
end

def next_bigger_num(integer)
  max_num = rotate_last_n(integer)
  if max_num < integer || max_num == integer
    -1
  else
    max_num
  end
end

#p rotate_last_n(735291)
p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1