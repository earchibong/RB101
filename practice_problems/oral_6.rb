=begin
Given two strings, your job is to find out if tere is a sub string that
appears in both strings. You will return true if you find the substring or false 
if you do not. we only care about substrings longer than one letter.

Problem:
Input: 2 string
output: boolean that...

- returns true if there is a common sbustring between the 2 input strings
- return false if there no common substring.

Rules / examples:
- substring should have a length greater than 1
- ignore lettercase

data structure: arrays

algorithm:
- find substring of both strings
  - validate substring by checking if length is greater than one
- compare validated substrings to check for common substring
  - iterate over string 1 substring
    - if any substring of the first string matches with any substring of the second
  input string, return 'true'
  - else return 'false'

=end

def string_1_sub(string1, string2)
str = string1.downcase
length = str.size
result = []

  0.upto(length - 1) do |index|
    index.upto(length - 1) do |idx|
      substring = str[index..idx]
      result << substring if substring.size > 1
    end
  end
  result
end

def string_2_sub(string1, string2)
  result = []
  str = string2.downcase
  length = str.size
  0.upto(length - 1) do |index|
    index.upto(length - 1) do |idx|
      substring = str[index..idx]
      result << substring if substring.size > 1
    end
  end
  result
end

def substring_test(string1, string2)
  subs1 = string_1_sub(string1, string2)
  subs2 = string_2_sub(string1, string2)
  
  subs1.any? do |substring|
    if subs2.any? { |substr| substr == substring }
      true
    else
      false
    end
  end
end

p substring_test('something', 'fun') == false
p substring_test('something', 'Home') == true
p substring_test('BANANA', 'banana') == true
p substring_test('1234567', '541265') ==true
p substring_test('test', '111t') == false