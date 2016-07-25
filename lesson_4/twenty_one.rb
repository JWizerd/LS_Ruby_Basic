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

deck = initialize_deck
player_cards = deck.sample(2)
dealer_cards = deck.sample(2)
puts "====================="
puts "Welcome to Twenty One"
puts "====================="
prompt("Here are your cards:")
puts "#{player_cards}"
prompt("Would you like to hit or stay?")
hit_or_stay = gets.chomp.downcase
if hit_or_stay == "hit" || hit_or_stay == "h"
  hit(player_cards)
  total(player_cards)
  puts "Total is: #{total(player_cards)}"
  if busted?(player_cards)
    prompt("BUSTED! Dealer Wins!")
  end
elsif hit_or_stay == "stay" || hit_or_stay == "s"
  prompt("Dealer's turn!")
  prompt("Dealer's Cards Are:")
  puts "#{dealer_cards[0]} and ?" 
  hit(dealer_cards)
  total(dealer_cards)
  if busted?(dealer_cards)
    prompt("BUSTED! Player Wins!")
  end
end