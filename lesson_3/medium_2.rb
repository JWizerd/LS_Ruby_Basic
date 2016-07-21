
# 1.________________________________________________

# Figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
total_age = 0
munsters.each do |name, details|
  total_age += details["age"] if details["gender"] == "male"
end


# 2.________________________________________________

# Given this previously seen family hash, print out the name, age and gender of each family member:
munsters.each do |name, details|
 puts "#{key} is name, they are #{value['age']} years old and are a gender of #{value['gender']}"
end

# 3.________________________________________________

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# 4.________________________________________________

sentence.split(" ").reverse!.join(" ")

# 5.________________________________________________

34

# 6.________________________________________________



# 7.________________________________________________

"paper"

# 8.________________________________________________

"no"

