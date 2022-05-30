=begin
Problem
Input: array or integers between 0 and 19

output: array of same integers...
  - sorted based on english words for each integer
  
 
rules/ examples:

  alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


data structure: array
algorithm:
given and array

find substrings of both strings
validate substrings
  - select only substrings with length greater than one for both sets of substrings
use one set of validated substring to check against the other for common substrings
 - if present, return true
 - else return false
   
 arr << char unless arr.count(char) == str2.chars.count(char)
  
  def scramble(str1, str2)
  result = str1.chars.each_with_object([]) do |char,arr|
    arr << char unless arr.count(char) == str2.chars.count(char)
  end
  result.sort.join == str2.chars.sort.join
end

def contains_all?(a1, a2)
  try = a1.chars.all? do |letter|
    a1.count(letter) <= a2.count(letter)
  end
  return try
end



def str1_substrings(string1, string2)
  str = string1.downcase.delete('^A-Za-z')
  length = str.size
  result = []
  
  0.upto(length - 1) do |index|
    index.upto(length - 1) do |idx|
      subs = str[index..idx]
      result << subs if subs.size == string2.size
    end
  end
  result
end
=end

def scramble(str1, str2)
  result = str1.chars.each_with_object([]) do |char,arr|
    arr << char unless arr.count(char) == str2.chars.count(char)
  end
  result.sort.join == str2.chars.sort.join
end

def scramble(str1, str2)
  result = []
  array = str1.chars
  array2 = str2.chars
  array.each do |char|
    result << char unless array.count(char) == array2.count(char)
  end
  result.sort.join == array2.sort.join
  
#p str1_substrings('rkqodlw', 'world')

p scramble('javaasss', 'jjss')
p scramble('rkqodlw', 'world')
p scramble('katas', 'steak')

