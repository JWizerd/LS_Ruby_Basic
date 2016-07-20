require 'pry'

# EXERCISES: EASY 2

# 1.________________________________________________

# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

#####

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#####

# 2.________________________________________________

# How can we add the family pet "Dino" to our usual array:

#####

flintstones.push("Dino", "Hoppy")

#OR

flinstones << "Dino"

#####


# 3.________________________________________________

# How can we add multiple items to our array? (Dino and Hoppy)

#####

flintstones.push("Dino", "Hoppy")

#####

# 4.________________________________________________

advice = "Few things in life are as important as house training your pet dinosaur."

# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

#####

advice.slice(0, 38)

advice.slice!(0,38)#destructively effects advice variable

#####

#5.________________________________________________

# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

#####

t_char_count = statement.scan(/[t]/).length

#####

#6.________________________________________________

# Back in the stone age (before CSS) we used spaces to align things on the screen. 
# If we had a 40 character wide table of Flintstone family members, 
# how could we easily center that title above the table with spaces?

#####

title = "Flintsone Family Members"

title.center(40)

#####
