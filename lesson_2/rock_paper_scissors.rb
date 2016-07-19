# ROCK PAPER SCISSORS GAME

# Objectives:
# - the user makes a choice
# - the computer makes a choice
# - the winnder is displayed

# Things to consider:
# - how is the logic going to look to decide which one is the winner (rock crushes scissor etc.)
# - ROCK BEATS SCISSORS, SCISSORS BEATS PAPER, PAPER BEATS ROCK

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "===== #{message}"
end

loop do
  prompt("choose one:  #{VALID_CHOICES.join(', ')}")

  choice = ''
  loop do
    choice = gets.chomp.downcase
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('Not a valid input. Try again.')
    end
  end

  computer_choice = VALID_CHOICES.sample

  if computer_choice == 'scissors' && choice == 'rock'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU WIN")
  elsif computer_choice == 'rock' && choice == 'scissors'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU LOSE")
  elsif computer_choice == 'paper' && choice == 'scissors'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU WIN")
  elsif computer_choice == 'scissors' && choice == 'paper'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU LOSE")
  elsif computer_choice == 'rock' && choice == 'paper'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU WIN")
  elsif computer_choice == 'paper' && choice == 'rock'
    prompt("You chose #{choice}; Computer chose #{computer_choice}.")
    prompt("YOU LOSE")
  else
    prompt("You chose #{choice}; Computer chose #{computer_choice}. TYE!")
  end

  puts "Play Again? Answer 'yes' or 'no'"
  answer = gets.chomp

  break unless answer == "yes"
end

prompt("THANKS FOR PLAYING ROCK PAPER SCISSORS! GOODBYE!")
