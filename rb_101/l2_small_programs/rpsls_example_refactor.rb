# This is a review of Esther Kim's code, to practice reading someone
# else's code and refactoring it.
require 'yaml'
MESSAGES = YAML.load_file('rpsls_example.yml')

VALID_OPTIONS = %w(r p sc l sp rock paper scissors spock lizard)
# WINNING_COMBO = {
#   ['rock','r'] => ['scissors', 'sc', 'lizard', 'l'],
#   ['paper','p'] => ['rock', 'r', 'spock', 'sp'],
#   ['scissors','sc'] => ['paper', 'p', 'lizard', 'l'],
#   ['lizard','l'] => ['spock', 'sp', 'paper', 'p'],
#   ['spock','sp'] => ['rock', 'r', 'scissors', 'sc']
# }

# WINNING_COMBO = {
#   'rock' => { abbreviation: 'r', beats: ['scissors', 'lizard'] },
#   'paper' => { abbreviation: 'p', beats: ['rock', 'spock'] },
#   'scissors' => { abbreviation: 'sc', beats: ['paper', 'lizard'] },
#   'lizard' => { abbreviation: 'l', beats: ['spock', 'paper'] },
#   'spock' => { abbreviation: 'sp', beats: ['rock', 'scissors'] }
# }

WINNING_COMBO = {
  sp: ['r', 'sc', 'rock', 'scissors'],
  spock: ['r', 'sc', 'rock', 'scissors'],
  sc: ['paper', 'p', 'lizard', 'l'],
  scissors: ['paper', 'p', 'lizard', 'l'],
  r: ['scissors', 'sc', 'lizard', 'l'],
  rock: ['scissors', 'sc', 'lizard', 'l'],
  l: ['spock', 'sp', 'paper', 'p'],
  lizard: ['spock', 'sp', 'paper', 'p'],
  p: ['rock', 'r', 'spock', 'sp'],
  paper: ['rock', 'r', 'spock', 'sp']
}

def prompt(message)
  puts("=> #{message}")
end

def operation_to_message(choice)
  if %w(rock r).include?(choice)
    'rock'
  elsif %w(p paper).include?(choice)
    'paper'
  elsif %w(sc scissors).include?(choice)
    'scissors'
  elsif %w(sp spock).include?(choice)
    'spock'
  elsif %w(l lizard).include?(choice)
    'lizard'
  end
end

def display_winner(player_score, computer_score)
  if player_score > computer_score
    prompt(MESSAGES['win'])
  else
    prompt(MESSAGES['lost'])
  end
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['name_of_game'])
prompt(MESSAGES['rules'])
puts("\n")

name = ''
loop do
  prompt(MESSAGES['name'])
  name = gets.chomp.strip.capitalize

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Welcome, #{name}")
puts("\n")

loop do
  user_choice = ''
  player_score = 0
  computer_score = 0
  current_computer_score = 0
  current_player_score = 0

  loop do
    loop do
      choice_prompt = <<~MSG
        Choose your weapon!
        r) rock
        sc) scissors
        p) paper
        l) lizard
        sp) spock
        MSG

      prompt(choice_prompt)
      user_choice = gets.chomp.strip

      # INPUT VALIDATION
      if VALID_OPTIONS.include?(user_choice)
        break
      else
        prompt(MESSAGES['valid_selection'])
      end
    end

    system('clear')

    computer_choice = VALID_OPTIONS.sample

    prompt("You chose: #{operation_to_message(user_choice)}")
    prompt("Computer chose: #{operation_to_message(computer_choice)}")
    puts("\n")

    # CONDITIONAL TO DETERMINE WINNER
    if user_choice == computer_choice
      prompt(MESSAGES['tie'])
      puts("\n")
    elsif WINNING_COMBO[user_choice.to_sym].include?(computer_choice)
      prompt(MESSAGES['win_round'])
      puts("\n")
      current_player_score = (player_score += 1)
    else
      prompt(MESSAGES['lose_round'])
      puts("\n")
      current_computer_score = (computer_score += 1)
    end

    # DISPLAY THE SCORE!
    prompt("Your score is: #{current_player_score}")
    prompt("Computer score is: #{current_computer_score}")
    puts("\n")

    # END THE LOOP IF ONE USER REACHES 3
    break if current_player_score == 3 || current_computer_score == 3
  end

  display_winner(current_player_score, current_computer_score)

  # INPUT VALIDATION TO CONTINUE PLAYING
  prompt(MESSAGES['play_again'])
  play_again = ''
  yes_answers = %w(y yes yeah yessir)
  no_answers = %w(n no nope nada)
  loop do
    play_again = gets.chomp.strip.downcase
    if yes_answers.include?(play_again) || no_answers.include?(play_again)
      break
    else
      prompt(MESSAGES['play_again_valid_input'])
    end
  end

  # PROGRAM DECIDES TO CONTINUE OR NOT
  break if no_answers.include?(play_again)
  next if yes_answers.include?(play_again)
end

prompt(MESSAGES['goodbye'])
