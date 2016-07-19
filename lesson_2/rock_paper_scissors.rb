# ROCK PAPER SCISSORS GAME

# Objectives:
# - the user makes a choice
# - the computer makes a choice
# - the winnder is displayed

VALID_CHOICES = %w(rock paper scissors)

# GAME LOGIC
def prompt(message)
  puts "===== #{message}"
end

def display_result(player, computer)
  if computer == 'scissors' && player == 'rock'
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("YOU WIN")
  elsif computer == 'rock' && player == 'scissors'
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("YOU LOSE")
  elsif computer == 'paper' && player == 'scissors'
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("YOU WIN")
  elsif computer == 'scissors' && player == 'paper'
    prompt("You chose #{player}; Computer #{computer}.")
    prompt("YOU LOSE")
  elsif computer == 'rock' && player == 'paper'
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("YOU WIN")
  elsif computer == 'paper' && player == 'rock'
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("YOU LOSE")
  else
    prompt("You chose #{player}; Computer chose #{computer}. TYE!")
  end
end

def valid_input?(value)
  VALID_CHOICES.include?(value) ? true : false
end

def valid_choice
  value = gets.chomp
  if valid_input?(value)
    return value
  else
    prompt("Not valid input. Try again.")
    valid_choice
  end
end

# GAME LOOP
loop do
  prompt("choose one:  #{VALID_CHOICES.join(', ')}")

  choice = valid_choice

  computer_choice = VALID_CHOICES.sample

  display_result(choice, computer_choice)

  puts "Play Again? Answer 'yes' or 'no'"
  answer = gets.chomp.downcase
  break unless answer == "yes"
end

prompt("THANKS FOR PLAYING ROCK PAPER SCISSORS! GOODBYE!")
