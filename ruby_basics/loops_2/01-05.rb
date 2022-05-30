=begin

1. Even or Odd?
Write a loop that prints numbers 1-5 and whether the number is even or odd. 
Use the code below to get started.

count = 1

loop do
  count += 1
end

Expected output
1 is odd!
2 is even!
3 is odd!
4 is even!
5 is odd!
=end

count = 1

loop do
  break if count > 5
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end
  count += 1
end

=begin

2. Catch the number

Modify the following code so that the loop stops 
if number is equal to or between 0 and 10.

loop do
  number = rand(100)
  puts number
end

=end

loop do
  number = rand(100)
  puts number
  break if number.between?(0, 10)
end

=begin

3. Conditional Loop
Write an if/else statement that executes some code if the process_the_loop 
variable is true and some other code when process_the_loop is false. 

Specifically:

When process_the_loop is true, execute a loop that iterates exactly once and prints 
The loop was processed during that iteration.

When process_the_loop is false, just print The loop wasn't processed!.
Use the following code to initialize process_the_loop. 
It will randomly assign the variable to either true or false.
=end

process_the_loop = [true, false].sample

loop do
  if process_the_loop
    puts "the loop was processed during that iteration"
    break
  else
    puts "the loop wasn't processed!"
  end
  break
end

=begin

4. Get The Sum

The code below asks the user "What does 2 + 2 equal?" and 
uses #gets to retrieve the user's answer. 

Modify the code so "That's correct!" is printed 
and the loop stops when the user's answer equals 4. 

Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

=end

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong Answer. Try again!"
  end
end

=begin

5. Insert Numbers
Modify the code below so that the user's input gets added to the numbers array. 
Stop the loop when the array contains 5 numbers.

=end

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end
puts numbers
