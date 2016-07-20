# EXERCISES: EASY 1

# 1.________________________________________________

1
2
2
3


#####
# Numbers.uniq is not a destructive method. Therefore "puts numbers" will return the original array
# and .uniq will create a new array with the dupliate objects reduced to one. 
#####

# 2.________________________________________________

# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

#####
# != NOT EQUAL TOO, USED IN CONDITIONALS
# put ! before something, like !user_name; SETS THE VALUE OF A VARIABLE TO FALSE
# put ! after something, like words.uniq!; MAKES THE METHOD DESTRUCTIVE, THAT IS, ALTERING ORGINIAL OBJECT
# put ? before something; TERNARY OPERATOR
# put ? after something; THIS IS A CONVENTION, IT IS USED TO SIGNIFY IF SOMETHING (LIKE A METHOD) IS USED TO FIND TRUE OR FALSE
# put !! before something, like !!user_name; CHECKS IF OBJECT IS ABSOLUTELY TRUE OR FALSE
#####

# 3.________________________________________________

# Replace the word "important" with "urgent" in this string:

# advice = "Few things in life are as important as house training your pet dinosaur."

advice.sub!('important', 'urgent')

# 4.________________________________________________

# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ: 

numbers = [1, 2, 3, 4, 5]

#####
# delete_at 1 deletes the value from the index of 1. [2]
numbers.delete_at(1)

# delete finds 1 in the array and deletes it
numbers.delete(1)

# both methods are destructive
#####

#5.________________________________________________

# Programmatically determine if 42 lies between 10 and 100.

(10..100).cover?(42)

#6.________________________________________________

# Starting with the string:
# famous_words = "seven years ago..."

#####
# method 1:

famous_words = "seven years ago.."

more_words = "four score and "

the_most_famous_words = more_words + famous_words

#method 2: 

more_words.concat(famous_words)

#####

#7.________________________________________________

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

# What will be the result?

#####

## irb > "add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"

eval(how_deep)

## irb > 42

#####

#8.________________________________________________

#If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# this will result in a multidimensional array

# to flatten this to one single array

flintstones.flatten!

#9.________________________________________________

# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.assoc("Barney")

#10.________________________________________________

#Given the array below

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |key, val|
  flintstones_hash[key] = val
end








