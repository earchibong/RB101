=begin
Write a method that takes a string as an argument, and returns true if all 
parentheses in the string are properly balanced, false otherwise. 
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).


Problem:
input = string
output = boolean (true if balanced / false if not)

examples: rules
- to be balanced paranthesis must occur in matching pair
   - '(' followed by ')'
- balanced pair MUSt start with '('

data structure: array
alogrithm:
Ginve a string:
- count character in string
- initialise a varaible 'paren' to integer 0
- iterate over the string
  - check for 2 conditions to give a `true` output
    - perform a count to see if the number of '(' equals ')'
       - add 1 to `paren` if '('
       - subtract 1 from `paren` if ')'
    - if '(' appears first
       - break if paren < 0
       - paren being negative shows that '(' doesn't appear first.
    
  - both conditions are met if paren is zero

   
=end



def balanced?(string)
  paren = 0
  string.each_char do |char|
    paren += 1 if char == '('
    paren -= 1 if char == ')'
    break if paren < 0
  end
  paren.zero?
end
  
p balanced?('What (is) this?') #== true
p balanced?('What is) this?') #== false
p balanced?('What (is this?') #== false
p balanced?('((What) (is this))?') #== true
p balanced?('((What)) (is this))?') #== false
p balanced?('Hey!') #== true
p balanced?(')Hey!(') #== false
p balanced?('What ((is))) up(') #== false