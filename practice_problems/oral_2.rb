=begin
given an array of strings made only from lowercase letters, return an aray of all 
characters that show up in all strings within the given array (including duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you 
need to include that character, 3 times in the final answer

problem:
input array of strings

output : array that...
- includes all characters that show up in all strings in the input array
  - characters that are common in all the elements of the array
  
Rules / examples
Array...
  - must include duplicates of common characters
    - if "l" appears 2ce in all the elements, it MUST appear 2ce in final array

Data structure: Array

Algorithm:
- split all strings in given array into characters
- use the first sub_array to find common characters in the rest of the array
  - find the intersection between all three sub_arrays
- count the frequency of each common character and return the character the
corresponding number of times.
  - iterate over each intesected element
  - for each string in the input array, 
    - find all instances of the intersected element
    - count the number of instances in each string
    - return the intersected element the number of instances that are the same
    for all string in the input array.
    - return number of occurences that are the same for all elements of the
    input array.


  
p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) = ["o"]
=end

=begin 
def common_chars(array)
  array_chars = array.map(&:chars)#{ |string| string.chars }
  intersected = array_chars.reduce(&:&)
  intersected.map do |char|
    array.map { |string| string.scan(char) }.min
  end.flatten
end
=end
    

def common_chars(array)
  result = []
  comp_string = array[0].chars
  comp_string.uniq.each do |char|
    sub_array = array[1..-1]
      result << char if sub_array.all? { |string| string.include?(char) }
  end
  result.map do |char|
    array.map { |string| string.scan(char) }.min
  end.flatten
end



def common_chars(array)
  characters = array.map(&:chars)
  intersection = characters.reduce(&:&)
  intersection.map do |char|
    array.map { |word| word.scan(char) }.min
  end.flatten
end   



p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]


