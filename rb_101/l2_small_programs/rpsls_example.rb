require 'yaml'
MESSAGES = YAML.load_file('rpsls_example.yml')

VALID_OPTIONS = %w(r p sc l sp)
WINNING_COMBO = {
  r: ['sc', 'l'],
  p: ['r', 'sp'],
  sc: ['p', 'l'],
  l: ['sp', 'p'],
  sp: ['r', 'sc']
}

def prompt(message)
  puts("=> #{message}")
end

def operation_to_message(choice)
  case choice
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 'sc'
    'scissor'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
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
        What would you like to play?
        r) rock
        sc) scissor
        p) paper
        l) lizard
        sp) spock
        MSG

      prompt(choice_prompt)
      user_choice = gets.chomp.strip

      if VALID_OPTIONS.include?(user_choice)
        break
      else
        prompt(MESSAGES['valid_selection'])
      end
    end

    # system('clear')

    computer_choice = VALID_OPTIONS.sample

    prompt("You chose: #{operation_to_message(user_choice)}")
    prompt("Computer chose: #{operation_to_message(computer_choice)}")
    puts("\n")

    if user_choice == computer_choice
      prompt(MESSAGES['tie'])
      puts("\n")
    elsif WINNING_COMBO.key?(user_choice.to_sym) &&
          WINNING_COMBO[user_choice.to_sym].include?(computer_choice)
          # binding.pry
      prompt(MESSAGES['win_round'])
      puts("\n")
      current_player_score = (player_score += 1)
    elsif WINNING_COMBO.key?(computer_choice.to_sym) &&
          WINNING_COMBO[computer_choice.to_sym].include?(user_choice)
      prompt(MESSAGES['lose_round'])
      puts("\n")
      current_computer_score = (computer_score += 1)
    end

    prompt("Your score is: #{current_player_score}")
    prompt("Computer score is: #{current_computer_score}")
    puts("\n")

    break if current_player_score == 3 || current_computer_score == 3
  end

  # system('clear')
  
  p current_player_score
  p current_computer_score
  display_winner(current_computer_score, current_player_score)

  prompt(MESSAGES['play_again'])
  play_again = gets.chomp.strip.downcase

  break unless play_again == 'y'
  # system('clear')
end

prompt(MESSAGES['goodbye'])