=begin

PROBLEM: Given a string, find all substrings of at least 2 characters where the 
substring is adjacent to a substring that is the reverse of itself

All even palindromes of at least 4 characters, split in half

input: string
output: array of substrings that are ...

Example / Rules
  - must be adjacent
  - must be at least 2 chars, so the palidrome must be at least 4 characters
  - must be a palindrome that can be split in two
    - it must even in size
      "hellolleh" is a palidrome but cannot be split evenly to make two strings that reverse
      "helloolleh" would work

  Data Structures
  - Array

Alogirthm
- Find all substrings that begin with the first letter of the given string
(leading strings)
- use leading strings to find all substrings of the string
- find sub_strings that are palindromes
- validate the palindromes to make sure they are :
  - at least 4 characters
  - can be split in half : must be even in size
- split each validated substring in half
- return the first half next to the 2nd half in an array
  
  
=end

def leading_strings(string)
  result = []
  0.upto(string.size-1) do |index|
    result << string[0..index]
  end
  result
end

def sub_strings(string)
  result = []
  0.upto(string.size) do |index|
    subs = string[index..-1]
    result << leading_strings(subs)
  end
  result.flatten
end

def palindrome?(string)
  string == string.reverse && string.size >= 4 && string.size.even?
end



def validated_substrings(string)
  all_strings = sub_strings(string)
  validated = []
  all_strings.each do |sub_string|
    validated << sub_string if palindrome?(sub_string)
  end
  validated
end

def find_reverse_substrings(string)
  sub_strings = validated_substrings(string)
  reverse = []
  sub_strings.each do |el|
    middle = el.size / 2
    length = el.size - middle
    first = el.slice(0, middle)
    second = el.slice(middle, length)
    reverse << first << second
  end
  reverse
end

  

#validated_substrings('beeekkeeper')
p find_reverse_substrings('beeekkeeper')# == ["eek", "kee", "ek", "ke"]
p find_reverse_substrings('1221345543') == ["12", "21", "345", "543", "45", "54"]