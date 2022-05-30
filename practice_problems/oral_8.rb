=begin
Find the length of the longest substring in the given string that is the same
in the reverse.

example: if input was: 'I like racecars that go fast', the substring (racecar)
length would be 7

if the length of the substring is 0, the retun value must be 0

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome(baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9

problem
input: string
output: integer that...
- that is the longest substring in the given string that is a palindrome

rules
- retun 0 if the length of the input string is 0

data structure : array
alogorithm:
- find all substring of the given string
- validate by selecting substring that are palindromes
- select the palindrome with the longrest length
  - if length of input string is 0 return 0

=end

def palindrome?(string)
  string == string.reverse
end

def substring(string)
  result = []
  0.upto(string.size - 1) do |index|
    index.upto(string.size - 1) do |idx|
      subs = string[index..idx]
      result << subs if palindrome?(subs)
    end
  end
  result.max_by { |string| string.length }
end

def longest_palindrome(string)
  substr = substring(string)
  if substr.size == 0
    0
  else
    substr.size
  end
end

#p substring('baabcd')
p longest_palindrome('baabcd') == 4
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9