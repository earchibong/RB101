=begin
Take everything you've learned so far and build a mortgage calculator
(or car payment calculator -- it's the same thing).

You'll need three pieces of information:

the loan amount
the Annual Percentage Rate (APR)
the loan duration
From the above, you'll need to calculate the following things:

monthly interest rate
loan duration in months
monthly payment.

You can use the following formula:
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

=end

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts " => #{message}"
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
  loan_amount = ' '
  loop do
    prompt(MESSAGES['loan_amount'])

    loan_amount = gets().chomp()
    break if valid_number?(loan_amount)
    prompt(MESSAGES['invalid_loan_amount'])
  end

  interest_rate = ' '
  loop do
    prompt(MESSAGES['interest_rate'])
    prompt(MESSAGES['interest_rate2'])

    interest_rate = gets().chomp()
    break if valid_number?(interest_rate)
    prompt(MESSAGES['invalid_interest_rate'])
  end

  loan_duration = ' '
  loop do
    prompt(MESSAGES['loan_duration'])

    loan_duration = gets().chomp()
    break if valid_number?(loan_duration)
    prompt(MESSAGES['invalid_loan_duration'])
  end

  monthly_interest = (interest_rate.to_f() / 12).round(2)

  monthly_duration = loan_duration.to_i() * 12

  monthly_payment = (loan_amount.to_f() *
                    (monthly_interest /
                    (1 - (1 + monthly_interest)**(- monthly_duration))))
  monthly_payment.round(2)

  prompt("your monthly interest will be #{monthly_interest}%")
  prompt("your loan duration will be #{monthly_duration} months")
  prompt("your monthly payments will be #{monthly_payment}")
  prompt(MESSAGES['calculate_again'])

  answer = gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
