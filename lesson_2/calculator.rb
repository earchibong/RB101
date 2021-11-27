=begin
Build a command line calculator program that does the following:

- ask the user for 2 numbers
- ask the user for operation to perform
- perform operation on the 2 numbers
- output the results

=end

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i().to_s() == num
end

def float?(num)
  num.to_f().to_s() == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  case op
  when "1"
    "adding"
  when "2"
    "subtracting"
  when "3"
    "multiplying"
  when "4"
    "dividing"
  end
end

prompt(MESSAGES['welcome'])

name = ' '
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("hello #{name}")

loop do # main loop
  number_one = ' '
  loop do
    prompt(MESSAGES['first_number'])
    number_one = Kernel.gets().chomp()

    if valid_number?(number_one)
      break
    else
      prompt(MESSAGES['valid_first_number'])
    end
  end

  number_two = ' '
  loop do
    prompt(MESSAGES['second_number'])
    number_two = Kernel.gets().chomp()

    if valid_number?(number_two)
      break
    else
      prompt(MESSAGES['valid_second_number'])
    end
  end

  operator = ' '
  operator_prompt = <<-MSG
  "What operation would you like to perform? Enter a number:
  1) add,
  2) subtract, 
  3) multiply, 
  4) divide
  MSG
  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES['invalid_operator'])
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number_one.to_i() + number_two.to_i()
           when '2'
             number_one.to_i() - number_two.to_i()
           when '3'
             number_one.to_i() * number_two.to_i()
           when '4'
             number_one.to_f() / number_two.to_f()
           end

  prompt("The result is #{result}")
  prompt(MESSAGES['calculate_again'])
  answer = gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
