require 'pry'

# EXERCISES: EASY 2

# 1.________________________________________________

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

#####

ages.member?("Spot")

ages.key?("Spot")

#####

# 2.________________________________________________

# Add up all of the ages from our current Munster family hash:

#####

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

munster_family_age_total = 0

ages.each do |key, val|
  munster_family_age_total += ages[key]
end

# OR

ages.values.inject(:+)

#####

# In the age hash throw out the really old people (age 100 or older).

# 3.________________________________________________

#####

ages.delete_if{|person, age| age > 100}

#####

# 4.________________________________________________

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

#####
1.  munsters_description.downcase.capitalize

2.  munsters_description.swapcase!
    munsters_description["THE"] = "tHE"
    munsters_description["MUNSTERS"] = "mUNSTERS"

3.  munsters_description.downcase

4.  munsters_description.upcase
#####

#5.________________________________________________

# We have most of the Munster family in our age hash:

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

#####

ages = ages.merge!(additional_ages)

#####

#6.________________________________________________

# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

#####

ages.values.min

#####

#7.________________________________________________

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

#####

advice.include?("Dino")

=> false

#####

#8.________________________________________________

# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#####

flintstones.find_index { |instance| instance.match( "Be" ) }

#####

#9.________________________________________________

# Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#####

flintstones.map! do |name|
  name[0, 3]
end

#####

#10.________________________________________________

#####

flintstones.map! { |name| name[0, 3] }

#####








