=begin
input = string
output = array that...
-- is a substring of the input string that..
  -- adjacent to a substring that is the reverse of itself
  -- substring that is a palindrome divided into 2..put next to each other
  
rules:
-- adjacent
-- palindrome
-- at least 2 chracters...
  - at least 4 chracters
  - must be even in size
  
data structure : array

algorithm:
- find all substrings of the input string
  - find substrings that at the first chracters of string
  - use that to find the rest of the substrings
- validate substring by checking if:
  - palindrome: check if string is the reverse of itself
  - even in size
  - has at least 4 chracters
- split the substring in half and put each half next to each other
  - find the middle 
    - dividing the array length into 2
    - slicing the substring array 
      - from 0 - middle
      - from middle to end
      return both in an array
     
=end

def palindrome?(string)
  string == string.reverse && string.size >= 4 && string.size.even?
end

def substring(string)
  result = []
  0.upto(string.size - 1) do |index|
    index.upto(string.size - 1) do |idx|
      result << string[index..idx] if palindrome?(string[index..idx])
    end
  end
  result
end


def find_reverse_substrings(string)
  result = []
  validated = substring(string)
  validated.each do |string|
    middle = string.size / 2
    first = string.slice(0, middle)
    second = string.slice(middle, string.size - middle)
    result << first << second
  end
  result.uniq
end
    



p find_reverse_substrings('1221345543') == ["12", "21", "345", "543", "45", "54"]
p find_reverse_substrings('beeekkeeper') #== ["eek", "kee", "ek", "ke"]
p find_reverse_substrings('1111111') #== ["11", "111"]
p find_reverse_substrings('hellolleh') == []
p find_reverse_substrings('testtsetsubjecttcejbus') == ["test", "tset", "est", "tse", "st", "ts", "subject", "tcejbus", "ubject", "tcejbu", "bject", "tcejb", "ject", "tcej", "ect", "tce", "ct", "tc"]
