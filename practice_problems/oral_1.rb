=begin
Problem
Input: string 

output: boolean
  check if given string can be created with a substring and multiple substring
  added together.
  true if it can be done
  false if it can't
  
 
rules/ examples:
- check if input string can be contructed using a substring of it AND adding
multiple substrings of it.
   - abab == ab + ab
   - substring will have to be a multiple of the size of the string
   
- string  == lowercase English letters only.
  


data structure: array
algorithm:
given string

 - find substrings of the string that start with the first letter
    - the size of te calling collection should be half of the input string
 - validate substrings
    - check if the length of the string is evenly divisly by the substring
 - validate if string can be created by substring + multiple copies
   - for each validated substring , multiply it by the length of the string
   divided by the length of the substring
   - check if substring multiplication is equal to the string.
     - return true or false
   
 
  
=end

def leading_strings(string)
  substring = []
  array = string.chars
  1.upto(array.size / 2) do |index|
    subs = string[0..index]
    substring << subs if array.size % index == 0
  end
  substring
end

def repeated_substring_pattern(string)
  substrings = leading_strings(string)
  substrings.each do |substring| 
    if substring * (string.size / substring.size) == string
      return true
    else
      return false
    end
  end
end

#p repeated_substring_pattern("abab") == true
#p repeated_substring_pattern("aba") == false
p leading_strings("ababab")
