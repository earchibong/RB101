=begin
build a Rock Paper Scissors game. The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed
=end

VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=>#{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt('you win!')
  elsif win?(computer, player)
    prompt('you lose!')
  else
    prompt("it's a tie!")
  end
end

loop do # main loop
  choice = ' '
  loop do
    prompt("choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    break if VALID_CHOICES.include?(choice)
    prompt("invalid choice. try again")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice} and the computer chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('do you want to play again?')
  reply = Kernel.gets().chomp()
  break unless reply.downcase().start_with?('y')
end

prompt('Thank you for playing. Good-bye!')
