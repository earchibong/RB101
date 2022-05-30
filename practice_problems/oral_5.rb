=begin
Write a method to find the longest common prefix string amongst an array of
strings.
If there is no common prefex, return an empty string : ""

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['dog', 'car', 'racecar']) == ""

all given inputs are in lowercase: a-z

Problem:
input: array ..of strings

output: string that...
 - is a prefix
   - must start at the beginning of the string
 - all input elements of the array have it
 - longest length
 
 Rules / examples
 - return an empty string if tyere is no common prefix
 
 data structure:
 array
 
 algorithm
 given an array of strings...
   - initialise an empty string
  - use first element of the array to compare with the rest of elements and
  select the most common characters / prefix
   - split the first element of the input array into characters : this should create an array
   - iterate over this collection
     - for each character passed into the block...
       - check if all the remaining strings in the input array [1..-1] have
         this character in the same position
       - if true, push the characters into the empty string.
     - repeat until iteration is over
     - return new string.
=end

def common_prefix(array)
  new_string = ""
  first_element = array.first.chars
  first_element.each_with_index do |char, index|
    subs = array[1..-1]
    new_string << char if subs.all? { |string| string[index] == char }
  end
  new_string
end

p common_prefix(['flower', 'flow', 'flight']) == 'fl'
p common_prefix(['interspecies', 'interstellar', 'interstate']) == 'inters'
p common_prefix(['dog', 'car', 'racecar']) == ""