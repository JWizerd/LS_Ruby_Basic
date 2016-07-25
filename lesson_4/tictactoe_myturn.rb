INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

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

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select{ |value| brd[value] == INITIAL_MARKER}
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def player_places_piece(brd)
  square = ''
  prompt "#{empty_squares(brd).join(', ')}"
  loop do
    prompt "enter a number 1-9"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "enter another number."
    end
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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
  nil
end

def someone_won?(brd) 
  !!detect_winner(brd)
end

# GAME LOOP
answer = 'yes'
loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    display_board(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a TYE!" 
    display_board(board)
  end

  prompt("PLAY AGAIN?")
  answer = gets.chomp
break unless answer == 'yes'
end
prompt("THANKS FOR PLAYING! GOODBYE!")



