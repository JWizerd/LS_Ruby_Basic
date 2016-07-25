# Tic Tac Toe 
# 1. Welcome, display board
# 2. Ask user for input
# 3. check to see if place is taken. else, put user in space.
# 4. computer randomly puts in places that are not already occupied.
# 5. check for winner. 3 in a row ELSE tye.
# 6. play again? if 'yes' loop to #2 else close app

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

# the initialize_board method creates a hash new_board and then populates it with 0..9 keys to represent our board.
# we then set the new_board hash as the value of the board variable so we can access it globally within all methods.

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "================="
  puts "TIC TAC TOE-MATER"
  puts "================="
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == INITIAL_MARKER}
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_winner(brd)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9]] + 
                  [[1,4,7], [2,5,8], [3,6,9]] +
                  [[1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER && 
       brd[line[1]] == PLAYER_MARKER && 
       brd[line[2]] == PLAYER_MARKER
      return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER && 
       brd[line[1]] == COMPUTER_MARKER && 
       brd[line[2]] == COMPUTER_MARKER
       return "Computer"
    end
  end
  nil # IMPORTANT: when returned nil this signifies that nobody has won yet.
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Please enter a number (1-9)")
    prompt("Choose a square #{empty_squares(brd).join(', ')}")
    square = gets.chomp.to_i 
    # we have to check to see if a given space is taken. to do so, we can iterate through keys (like below)
    # and check IF values of board keys are equal to ' ' break loop. If not ask for user to input another number/space
    if empty_squares(brd).include?(square)
      break
    else
      prompt("Sorry that's an invalid choice.")
    end
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

# GAME LOOP
answer = 'yes'
loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    display_board(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt("It's a TYE!")
    display_board(board)
  end

  prompt("PLAY AGAIN?")
  answer = gets.chomp
break unless answer == 'yes'
end
prompt("THANKS FOR PLAYING! GOODBYE!")
