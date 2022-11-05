# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# Kernel.gets() # in ruby, parentheses are optional when INVOKING a method call.
# We pass arguments into the parentheses.

# default language for program
LANGUAGE = 'es'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en') # default parameter
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number 
end

def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end

  x = "a random line of code"
  word # this is to ensure the return value is from the case statement 
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # the main loop!
  number1 = nil
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp() # append chomp to gets
    break if number?(number1)
    prompt(MESSAGES['valid_number']) # error message
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp() # append chomp to gets
    break if number?(number2)
    prompt(MESSAGES['valid_number']) # error message
  end

  prompt(MESSAGES['operator_prompt'])

  operator = nil
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator) # shortcut for an array of strings
      break
    else
      prompt(MESSAGES['option_prompt'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The answer is #{result}!")

  prompt(MESSAGES['ask'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank_you'])
