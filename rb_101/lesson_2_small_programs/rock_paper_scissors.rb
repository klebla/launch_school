VALID_CHOICES = %w(rock paper scissors lizard spock)

def win?(first, second)
  (first == 'rock' && second == 'scissors' || second == 'lizard') ||
    (first == 'paper' && second == 'rock' || second == 'spock') ||
    (first == 'scissors' && second == 'paper' || second == 'lizard') ||
    (first == 'lizard' && second == 'spock' || second == 'paper') ||
    (first == 'spock' && second == 'scissors' || second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("The computer won!")
  else
    prompt("It's a tie!")
  end
end

def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp().downcase()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Continue playing? y/n")
  answer = Kernel.gets().chomp().downcase
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!")

# def win?(first, second)
#   (first == 'rock' && second == 'scissors') ||
#     (first == 'rock' && second == 'lizard') ||
#     (first == 'paper' && second == 'rock') ||
#     (first == 'paper' && second == 'spock') ||
#     (first == 'scissors' && second == 'paper') ||
#     (first == 'scissors' && second == 'lizard') ||
#     (first == 'lizard' && second == 'spock') ||
#     (first == 'lizard' && second == 'paper') ||
#     (first == 'spock' && second == 'scissors') ||
#     (first == 'spock' && second == 'rock')
# end