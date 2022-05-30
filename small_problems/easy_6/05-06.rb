=begin
Staggered Caps (Part 1)
Write a method that takes a String as an argument, and returns a new 
String that contains the original value using a staggered capitalization 
scheme in which every other character is capitalized, and the remaining 
characters are lowercase. Characters that are not letters should not be changed
, but count as characters when switching between upper and lowercase.


Problem
input = string

output = new string that...
 -  contains the original value of the argument
 - using a staggared capitalization scheme...
   - every other character is capitalized
     - every 2nd character
  - remaing chars are lowercase

rules / examples:
- Characters that are not letters should not be changed, 
but count as characters when switching between upper and lowercase.


staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'



 
data structure = string

algorithm
given a string
- split string into characters
- iterate array of characters
  - for each character passed to the block
    - check if the index of char is even?
       -  upcase the char
    - if character is non alphabetic 
      - return char
  - once iterationis complete, it would retrun the transformed array
  - i would join it to get the new string.

  
  
=end

def staggered_case(string)
  str = string.chars
  
  str.map.with_index do |char, index|
    if char =~ /[A-Za-z]/
      char
    else
      index.even? ? char.upcase : char.downcase
    end
  end.join
end


=begin
Staggered Caps (Part 2)
Modify the method from the previous exercise so it ignores non-alphabetic 
characters when determining whether it should uppercase or lowercase each letter. 
The non-alphabetic characters should still be included in the return value; 
they just don't count when toggling the desired case.
=end

def staggered_case(string)
  str = string.chars
  index = 0
  
  str.map do |char|
    if char =~ /[A-Za-z]/
      index += 1
      index.odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end


def staggered_case(string)
  counter = 0

  string.chars.map do |char|
    if char.match?(/[a-z]/i)
      counter += 1
      (counter).odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

#further exploration
def staggered_case(string)
  counter = 0
  string.chars.map do |char|
    if char.match?(/[a-z]/i)
      counter += 1
      (counter).odd? ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

def staggered_case_alpha(string)
  string.chars.map.with_index {|c, idx| idx.even? ? c.upcase : c.downcase }.join
end

def staggered_case_non_alpha(string, non_alpha)
  non_alpha ? staggered_case(string) : staggered_case_alpha(string)
end

staggered_case_non_alpha('ALL CAPS', true) == 'AlL cApS'
staggered_case_non_alpha('ALL_CAPS', false) == 'AlL_CaPs'