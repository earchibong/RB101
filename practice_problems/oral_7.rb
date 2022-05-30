=begin
write function scramble(str1, str2) that returns true if a portion of str1
characters can be re-arranged to match str2. Otherwise, retrun false.

only lowercase letters can be used. no punctuation or digits included.

Problem
input: 2 string
output: boolean that...

- is true if a portion of string 1 can be rearranged to match string 2
- or false it not.

rules / examples:
- only lowercase letters used
- no punctuation on digits 

p scramble('javaasss', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('katas', 'steak') == false

data structure: array
algorithm:
- Given 2 input strings:

  - initialise a new variable to an empty array
  - split both strings into characters
  - iterate over the string 1 collection
  - for each iteration
    - check if that character is present in the string 2 collection
    - check if the chracter has the same count in both collections
    - if true, skip to the next character
    - if false, add character to empty array
      
=end

def scramble(str1, str2)
  result = []
  array1 = str1.chars
  array2 = str2.chars
  array1.each do |char|
    result << char if array1.count(char) == array2.count(char)
  end
  result.sort.join == array2.sort.join
end


#alternstive

def scramble(str1, str2)
  str2_chars = str2.chars
  str2_chars.each do |char2|
    str2.count(char2) > str1.count(char2) ? false : true
  end
end

    
p scramble('javaasss', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('katas', 'steak') == false