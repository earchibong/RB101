=begin

6. Empty The Array
Given the array below, use loop to remove and print each name. 
Stop the loop once names doesn't contain any more elements.
=end

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  break if names.empty?
  name = names.shift
  puts name
end

=begin

7. stop counting

The method below counts from 0 to 4. 
Modify the block so that it prints the current number 
and stops iterating when the current number equals 2.

=end

5.times do |index|
  puts index
  break if index == 2
end

=begin

8. Only Even

Using next, modify the code below so that it only prints even numbers.

=end

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number 
end

=begin

9. First To Five

The following code increments number_a and number_b by either 0 or 1. 
loop is used so that the variables can be incremented more than once, 
however, break stops the loop after the first iteration. 

Use next to modify the code so that the loop iterates until 
either number_a or number_b equals 5. 

Print "5 was reached!" before breaking out of the loop.

=end

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  puts "5 was reached"
  break
end

=begin

10. Greeting
Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

=end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end