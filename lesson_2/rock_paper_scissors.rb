# ROCK PAPER SCISSORS GAME

# Objectives:
# - the user makes a choice
# - the computer makes a choice
# - the winnder is displayed

VALID_CHOICES = %w(rock paper scissors)
@player_score = 0
@computer_score = 0

# GAME LOGIC
def prompt(message)
  puts "===== #{message}"
end

def win?(player1, player2)
  player2 == 'scissors' && player1 == 'rock' ||
    player2 == 'paper' && player1 == 'scissors' ||
    player2 == 'rock' && player1 == 'paper'
end

def lose?(player1,  player2)
  player2 == 'rock' && player1 == 'scissors' ||
    player2 == 'scissors' && player1 == 'paper' ||
    player2 == 'paper' && player1 == 'rock'
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("PLAYER WINS! +1 for player")
  elsif lose?(player, computer)
    prompt("You chose #{player}; Computer chose #{computer}.")
    prompt("COMPUTER WINS! +1 for computer")
  else
    prompt("You chose #{player}; Computer chose #{computer}. TYE!")
    prompt("No Points Were Given.")
  end
end

def score_keeper(player, computer)
  if win?(player, computer)
    @player_score += 1
  elsif lose?(player, computer)
    @computer_score += 1
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

def reset_scores
  @player_score = 0
  @computer_score = 0
end

def game_loop
  until @player_score == 2 || @computer_score == 2
    puts "\r\n"
    prompt("choose one:  #{VALID_CHOICES.join(', ')}")
    choice = valid_choice
    computer_choice = VALID_CHOICES.sample
    score_keeper(choice, computer_choice)
    display_result(choice, computer_choice)
    prompt("Player: #{@player_score} | Computer: #{@computer_score}")
  end
end

def game_over?
  puts "GAME OVER. Play Again? Answer 'yes' or 'no'"
  answer = gets.chomp.downcase
  if answer != "yes" && answer != "no"
    puts "Please enter yes or no"
    game_over?
  elsif answer == "yes"
    true
  else
    false
  end
end

def game_controller
  game_loop
  reset_scores
  game_controller if game_over?
end

game_controller
prompt("THANKS FOR PLAYING ROCK PAPER SCISSORS! GOODBYE!")
