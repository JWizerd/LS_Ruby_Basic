# Tic Tac Toe

# 1. WELCOME MSG
# 2. DISPLAY BOARD and ask user for INPUT (Enter 1-9) # if play_again RESET BOARD
# 3. IF PLACE ON BOARD.empty? PLACE ON BOARD else ASK FOR INPUT AGAIN
# 4. COMPUTER TURN, DISPLAY UPDATED BOARD
# 5. IF 3 IN A ROW, Display Winner ELSE DISPLAY TYE
# 6. PLAY_AGAIN? IF "yes" go-to 1. IF "no" goodbye!

board_formulas = []

def message
  puts "=> #{message}"
end

def display_board(brd)
  puts ""
  puts " #{brd[1]} | #{brd[2]} | #{brd[3]} "
  puts "---+---+---"
  puts " #{brd[4]} | #{brd[5]} | #{brd[6]} "
  puts "---+---+---"
  puts " #{brd[7]} | #{brd[8]} | #{brd[9]} "
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each{|num| new_board[num] = 'X'}
  new_board
end

board = initialize_board
display_board(initialize_board)