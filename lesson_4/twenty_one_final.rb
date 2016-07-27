# Twenty One Game

require 'pry'

SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.collect { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value == "K" || value == "Q" || value == "J"
      sum += 10
    else
      sum += value.to_i
    end
  end

  # Accounting for Ace's
  values.select { |value| value == "A" }.count.times do
    if sum > 21
      sum -= 10
    end
  end

  sum
end

def busted?(cards)
  total(cards) > 21
end

def hit(cards_dealt)
  deck = SUITS.product(VALUES).shuffle
  cards_dealt << deck.sample # add another card to your hand
end

def winner(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)
  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tye
  end
end

def winning_message(player, dealer)
  result = winner(player, dealer)

  if result == :player_busted
    prompt "player busted! dealer won!"
  elsif result == :dealer_busted
    prompt "dealer busted! player won!"
  elsif result == :dealer
    prompt("The dealer has won.")
  elsif result == :player
    prompt("The player has won.")
  else
    prompt("It's a tie game!")
  end
end

def player_turn(player, dealer)
  loop do
    prompt "Your cards are #{player} for a total of: #{total(player)}"
    prompt "Dealer cards are #{dealer[0]} and ?"
    prompt "Would you like to hit or stay? enter 'hit' or 'stay'"
    hit_or_stay = gets.chomp.downcase

    if hit_or_stay == 'hit'
      hit(player)
      busted?(player)
      prompt "Your new total is #{total(player)}"
      compare_cards(player, dealer)
      winning_message(player, dealer)
    end

    break if busted?(player) ||
             hit_or_stay == 'stay' ||
             winner(player, dealer)
  end
end

def dealer_turn(player, dealer)
  prompt "Dealer's Turn:"

  loop do
    break if busted?(dealer) || total(dealer) >= 17
    prompt "DEALER HITS!"
    hit(dealer)
    prompt "Dealer's new total is #{total(dealer)}"
  end
  compare_cards(player, dealer)
  winning_message(player, dealer)
end

def compare_cards(player, dealer)
  prompt "Player Total: #{total(player)} Dealer Total: #{total(dealer)}"
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (yes or no)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# GAME LOOP
loop do
  deck = initialize_deck
  player_cards = deck.sample(2)
  dealer_cards = deck.sample(2)

  puts "======================"
  puts "Welcome to Twenty One!"
  puts "======================"

  # PLAYER TURN
  if busted?(dealer_cards) == false
    player_turn(player_cards, dealer_cards)
    if busted?(player_cards)
      play_again? ? next : break
    end
  end
  # DEALER TURN
  dealer_turn(player_cards, dealer_cards)

  break unless play_again?
end

prompt "THANKS FOR PLAYING! GOODBYE!"