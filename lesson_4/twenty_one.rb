# Twenty One Game

require 'pry'

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.collect {|card| card[1]}

  sum = 0

  values.each do |value|
    if value == "A"
      sum += 11
    elsif value == "J" || value == "Q" || value == "K"
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select {|value| value == "A"}.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  if total(cards) > 21 
    true
  else
    false
  end
end

def hit(cards_dealt)
  deck = initialize_deck
  cards_dealt << deck.sample # add another card to your hand
end

def winner(player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  if busted?(player_cards)
    :dealer
  elsif busted?(dealer_cards)
    :player
  elsif player_total > dealer_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def winner_message(player_cards, dealer_cards)
  result = winner(player_cards, dealer_cards)

  if result == :dealer
    prompt("The dealer has won.")
  elsif result == :player
    prompt("The player has won.")
  else
    prompt("It's a tie game!")
  end
end

# initialize vars
deck = initialize_deck
player_cards = []
dealer_cards = []

# initial deal
player_cards = deck.sample(2)
dealer_cards = deck.sample(2)

prompt "Dealer has #{dealer_cards[0]} and ?"
prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  if busted?(player_cards)
    winner_message(dealer_cards, player_cards)
  else
    prompt "You stayed at #{total(player_cards)}"
  end