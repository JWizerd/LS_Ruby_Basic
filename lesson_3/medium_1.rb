
# 1.________________________________________________

# For this exercise, write a one-line program that creates the following output 10 times, 
# with the subsequent line indented 1 space to the right:

Flintstones = "The Flintstones Rock"

10.times{ puts Flintstones.prepend(' ') }

# 2.________________________________________________

# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock 1 2 3 4 5 6 6 7 8"

letter_frequency = {}

array_of_chars = ('A'..'Z').to_a + ('a'..'z').to_a + ('1'..'100').to_a

array_of_chars.each do |character|
  result = statement.scan(character).count
  letter_frequency[character] = result if result > 0 
end

# HAD SOME TROUBLE WITH THIS. MY NOTES:
  # IN ORDER TO FIND FREQUENCY:
  # We have to create something to compare each letter and number too (the whole Alphabet Upper and Lowercase and 1..100) 
  # from there we can loop through statement using our array of chars using scan and get the count using .count
  # then from here it is simply adding the key value with frequency. Only keys that exist in statement will be pushed to hash.

# 3.________________________________________________

# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?
  # You can't concatenate a string an integer. 
  # (40 + 2).to_s
  # #{40 + 2}

# 4.________________________________________________

# What happens when we modify an array while we are iterating over it? What would be output by this code?
  # depending on the method used (whether destructive or not destructive) the method used will either store the effect
  # of the iteration in a new array OR in the case of a method like shift or pop will effect the original array. 
  numbers = [1, 2, 3, 4]
    numbers.each do |number|
    p number
    numbers.shift(1)
  end

  numbers = [1, 2, 3, 4]
  numbers.each_with_index do |number, index|
    p "#{index}  #{numbers.inspect}  #{number}"
    numbers.pop(1)
  end

# 5.________________________________________________


def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  puts divisors
end

factors(12)

# modulus allows you to determine if  number will divide evenly or not

# after the loop is done return divisors accumulated from loop in this case, 1 2 3 4 6


# 6.________________________________________________

# << or also PUSH modifies the existing array while array + [element] reassigns the arry to a different memory storage point.
# if the method was looping like in problem 4 we would see that the input would be different during the second pass.

# 7.________________________________________________

LIMIT = 15

def fib(first_num, second_num)
  while second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# the limit variable cannot be accessed within the local scope. 
# We can use a CONSTANT for this variable since limit is not going to change during execution.

# 8.________________________________________________

# In another example we used some built-in string methods to change the case of a string. 
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize! 
# This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.

# Write your own version of the rails titleize implementation.

def titleize(str)
  formatted_string = str.split.map { |word| word.capitalize }.join(" ") 
  return formatted_string
end

sample_string = "there's a snake in my boot"

titleize(sample_string)

second_string = titleize(sample_string)


# 9.________________________________________________

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
