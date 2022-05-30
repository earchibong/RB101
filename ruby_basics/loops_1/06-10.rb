=begin

6. Print While
Using a while loop, print 5 random numbers between 0 and 99. 
The code below shows an example of how to begin solving this exercise.

numbers = []

while <condition>
  # ...
end

=end


count = 0

while count < 5
  puts rand(100)
  count +=1
end

=begin

7. Count up
The following code outputs a countdown from 10 to 1.
Modify the code so that it counts from 1 to 10 instead.

count = 10

until count == 0
  puts count
  count -= 1
end

=end

count = 1

until count > 10
  puts count
  count += 1
end

=begin

8. Print Until

Given the array of several numbers below, 
use an until loop to print each number.

=end

numbers = [7, 9, 13, 25, 18]

count = 0

until count >= numbers.size
  puts numbers[count]
  count += 1
end 

=begin

9. That's Odd
The code below shows an example of a for loop. 
Modify the code so that it only outputs i if i is an odd number.

for i in 1..100
  puts i
end

=end

for i in 1..100
  puts i if i.odd? # (or puts i if i % 2 !=0)
end

=begin

10. Greet Your Friends
Your friends just showed up! Given the following array of names, 
use a for loop to greet each friend individually.

friends = ['Sarah', 'John', 'Hannah', 'Dave']

Hello, Sarah!
Hello, John!
Hello, Hannah!
Hello, Dave!
=end

friends = ['Sarah', 'John', 'Hannah', 'Dave']
count = 0

loop do
  break if count >= friends.size
  puts "Hello, #{friends[count]}!"
  count +=1
end

