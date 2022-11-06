# Obtain 3 pieces of info from the user
# 1. the loan amount
# 2. the annual percentage rate (APR)
# 3. the loan duration

# Calculate the following 3 things with said information:
# 1. monthly interest rate
# 2. loan duration in months
# 3. monthly payment

# Use this formula for the calculation:
# m = p * (j / (1 - (1 + j)**(-n)))

# Remember to run program through rubocop

# Link to configuration file
require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

require 'pry'

# METHODS
def prompt(key)
  message = MESSAGES[key]
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num
end

# Main loop and sub processes to obtain information accurately
loop do
  prompt('loan_amount')
  
  loan_amount = nil
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f < 0 || loan_amount.empty? # example of short-circuit execution from left to right. The first one that evaluates to true will execute, the rest will be ignored. 
      prompt("valid_number")
    else
      break
    end
  end

  prompt('apr')
  
  annual_interest_rate = nil
  loop do
    annual_interest_rate = gets.chomp
    if valid_float?(annual_interest_rate) && annual_interest_rate.to_f < 0 || annual_interest_rate.empty? 
      prompt("valid_apr")
    else
      break
    end
  end

  prompt('loan_duration')
  
  loan_duration_in_months = nil
  loop do
    loan_duration_in_months = gets.chomp
    if valid_number?(loan_duration_in_months) && loan_duration_in_months.to_i < 0 || loan_duration_in_months.empty?
      prompt("valid_number")
    else
      break
    end
  end

  # Determine monthy interest rate
  monthly_interest_rate = (annual_interest_rate.to_f / 12)

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate / (1 - (1 +
                    monthly_interest_rate)**(-loan_duration_in_months.to_i)))

  puts <<-MSG
  Your monthly interest rate is #{(monthly_interest_rate * 100).round(2)}%.
  Your loan duration is #{loan_duration_in_months} months.
  Your monthly payment is $#{monthly_payment.round(2)}.
  Your total payment is $#{(monthly_payment * loan_duration_in_months.to_i).round(2)}.
  MSG

  prompt('repeat_program')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')
