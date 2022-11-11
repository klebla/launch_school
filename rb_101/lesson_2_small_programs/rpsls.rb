VALID_CHOICES = %w(rock paper scissors lizard spock)

DETERMINING_WINNER = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['rock', 'scissors']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

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

def win?(first_choice, second_choice)
  DETERMINING_WINNER[first_choice.to_sym].include?(second_choice.to_s)
end

binding.pry

def display_results(player, computer)
  if win?(player, computer)
    prompt("=> You won! 1 point added.")
  elsif win?(computer, player)
    prompt("=> The computer won! 1 point to the bot.")
  else
    prompt("=> It's a tie!")
  end
end

# def score(player, computer)
#   if win?(player, computer)
#     human_wins += 1
#   elsif win?(computer, player)
#     computer_wins += 1
#   else
#     # do nothing
#   end
# end

loop do

  loop do
    # Input validation loop
    choice = nil
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp().downcase()

      if choice.start_with?('r')
        choice = 'rock'
        break
      elsif choice.start_with?('p')
        choice = 'paper'
        break
      elsif choice.start_with?('sc')
        choice = 'scissors'
        break
      elsif choice.start_with?('sp')
        choice = 'spock'
        break
      elsif choice.start_with?('l')
        choice = 'lizard'
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

    display_results(choice, computer_choice)

     # Incrementing to keep track of wins

     prompt("The score is human: #{human_wins} bot: #{computer_wins}")

     if human_wins == 3
      prompt("You win! Here's a crown.")
     elsif computer_wins == 3
      prompt("You lost to the bot.")
     else
      prompt("Next round...")
     end

  end

  prompt("Continue playing? y/n")
  answer = Kernel.gets().chomp().downcase
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing!")
