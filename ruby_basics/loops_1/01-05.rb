=begin

1. Runaway loop
The code below is an example of an infinite loop. The name describes exactly 
what it does: loop infinitely. 
This loop isn't useful in a real program, though. 
Modify the code so the loop stops after the first iteration.

loop do
  puts 'Just keep printing...'
end
=end

loop do
  puts 'Just keep printing...'
  break
end

=begin

2. Loopception
The code below is an example of a nested loop. 
Both loops currently loop infinitely.
Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'

=end

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end
  break
end

puts 'This is outside all loops.'

=begin

3. Control the loop
Modify the following loop so it iterates 5 times instead of just once.

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  break
end

=end

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations >= 5
end

=begin

4. Loop on command
Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end

=end

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.include?('yes')
  puts "invalid answer. please answer yes or no"
end

=begin

5. Say 'Hello'
Modify the code below so "Hello!" is printed 5 times.

say_hello = true

while say_hello
  puts 'Hello!'
  say_hello = false
end

=end

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello == false if counter == 5 #another way of breaking out of loop
end