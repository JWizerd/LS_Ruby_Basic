# Reverse an array without using the built-in reverse method.

def reverse(array)
  new_array = []
  new_array << array.pop until array.empty?
  new_array
end

# Select the element out of the array if its index is a fibonacci number.

def fib_index(array)

end

# Write a method to determine if a word is a palindrome, without using the reverse method.

def palindrome(string)
  if string == reverse(string)
    reverse(string)
  else
    puts "not a palindrome"
  end
end


def reverse(string)
  word_array = string.split('')
  reversed_word = []
  reversed_word << word_array.pop until word_array.empty?
  reversed_word.join
end

# reverse a string
def reverse(string)
  word_array = string.split('')
  string_reversed = []
  string_reversed << word_array.pop until word_array.empty?
  string_reversed.join
end

# Implement the search function within this code:

PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 },
]

query = {
  price_min: 240,
  price_max: 280,
  q: "thinkpad"
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: "dell"
}

def search(query)
  queried_products = PRODUCTS.select { |product| product[:name].downcase.include?(query[:q])}
  query_price_range = queried_products.select { |product| product[:price].between?(query[:price_min], query[:price_max])}
end


# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels removed.

def vowels_removed(array)
  vowels = "aeiouAEIOU"
  array.each { |word| word.delete!(vowels)}
end

# Write a method that takes a string, and returns a boolean indicating whether this string has a balanced set of parentheses.

def balanced_parens(string)
  parens = []
  string.chars.each do |char|
    if char == "("
      parens << "("
    elsif char == ")"
      parens << ")"
    end
  end
  parens.length.even? if !parens.empty?
end

# Write a method that takes two numbers. It should print out all primes between the two numbers. Don't use Ruby's prime class.

def prime?(number)
  return false if number < 2
  (2...number).each do |divisor|
    puts divisor
    return false if number % divisor == 0 
  end
  return true
end

def primes(number1,number2)
  (number1...number2).select { |num| prime?(num) }
end

  # b. Write a method that will take an array of numbers and only return those that are prime.

  def primes_in_array(array)
    array.select { |num| prime?(num) }
  end

  # c. return the number of primes in an array of numbers

  def number_of_primes(array)
    count = 0
    array.each { |num| count += 1 if prime?(num) }
    count 
  end

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer

def numbers_sum(start, finish)
  sum = (start..finish).inject(:+)
  puts "the sum of the numbers between #{start} and #{finish} is #{sum}"
end

def numbers_product(start, finish)
  product = (start..finish).inject(:*)
  puts "the product of numbers between #{start} and #{finish} is #{product}"
end

def integers_game
  answer = 'yes'
  while answer == 'yes'
    puts "enter a range of numbers (i.e. 10 through 15 would equal 10, 11, 12, 13, 14, 15)"

    puts "enter starting number"
    start = gets.chomp.to_i

    puts "enter finish number"
    finish = gets.chomp.to_i

    puts "would you like to create the sum or product of all numbers between this range. Enter 's' for sum or 'p' for product."

    sum_or_pro = gets.chomp

    if sum_or_pro == 's'
      numbers_sum(start, finish)
    elsif sum_or_pro == 'p'
      numbers_product(start,finish)
    end
    puts "play again??"
    answer = gets.chomp 
  end
end

integers_game








