=begin
Write a method that takes a string, and then returns a hash that contains
3 entries: one represents the percentage of characters in the string 
that are lowercase letters, one the percentage of characters that are 
uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

input:
- string 

output:
- hash that contains 3 entries:
  - percdentage of characters that are lowercase letters
  - percentage of characters that are uppercase
  - percentage of characters that are neither.

implicit:
- string always contains at least 1 character (no empty string)

data structure: hash

algorithm:
given a string:
- create a new hash with keys and assign 0 integer values to each
- split string into characters
- iterate over string characters
  count how many characters are upcase, downcase or neither and update
  the hash
- convert count to percentage:
      divide counted numer by total characters and multiply by 100

=end
def calculate_percentage(length, percentage_hash, count_hash)
  percentage_hash[:lowercase] = (count_hash[:lowercase] / length.to_f)*100
  percentage_hash[:uppercase] = (count_hash[:uppercase] / length.to_f)*100
  percentage_hash[:neither] = (count_hash[:neither] / length.to_f)*100
end


def letter_percentages(string)
  count_hash = {}
  percentage_hash = {}
  str = string.chars
  length = string.size
  
  count_hash[:lowercase] = str.count { |char| char =~ /[a-z]/ }
  count_hash[:uppercase] = str.count { |char| char =~ /[A-Z]/ }
  count_hash[:neither] = str.count { |char| char =~ /^[A-Za-z]/ }
  
  calculate_percentage(length, percentage_hash, count_hash)
  percentage_hash
end

p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123')# == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }