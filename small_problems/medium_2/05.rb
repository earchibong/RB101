=begin
A triangle is classified as follows:

equilateral = All 3 sides are of equal length
isosceles = 2 sides are of equal length, while the 3rd is different
scalene = All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be
greater than the length of the longest side, and all sides must have lengths 
greater than 0: if either of these conditions is not satisfied, the triangle 
is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
on whether the triangle is equilateral, isosceles, scalene, or invalid.

input = 3 numbers : lengths of 3 sides of a triangle
output - symbol = :equilateral, isoceles, scalene or invalid

Examples / rules
- valid triangle is:
  - sum of 2 shortest sides > longest side
  - all side must have lengths > 0
  
  data structure: 
  case statement
  
  algorithm
  given 3 integers
  

  - valid triangle
    - check if all sides have lengths > 0
    - sum of 2 shortest sides > longest side
      - find shortest lengths
         - put 3 numbers in an array
         - sort the array to identify 2 shortest sides
  - make invalid by using opposite of return value of valid
  - if statement to return triangle classification
=end

def triangle(a, b, c)
  lengths = [a, b, c]
  
  case
  when  lengths.any?(0) then :invalid
  when  lengths.max > lengths.min(2).reduce(:+) then :invalid
  when  a == b && b == c then :equilateral
  when a == b || a == c || b == c then :isoceles
  else
    :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
 p triangle(3, 3, 1.5) == :isoceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid