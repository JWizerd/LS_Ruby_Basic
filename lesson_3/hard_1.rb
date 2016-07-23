
# 1.________________________________________________

# Local Variable Error

# greeting is nil here, and no "undefined method or local variable" exception is thrown. 
# Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined. 
# However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, 
# the local variable is initialized to nil.

# 2.________________________________________________

# => {:a=>"hi there"} #destructive method for any object. Even though informal_greeting is a different reference than the hash greeting
# the variable is referencing back to an object reference there both are effected.

# 3.________________________________________________


# 4.________________________________________________

# UUID EXAMPLE: 4d312cda-50e7-11e6-beb8-9e71128cae77

def uuid
  range = [*'0'..'9',*'a'..'z']
  section_1 = (0...8).map{ range.sample }.join
  section_2 = (0...4).map{ range.sample }.join
  section_3 = (0...4).map{ range.sample }.join
  section_4 = (0...4).map{ range.sample }.join
  section_5 = (0...12).map{ range.sample }.join

  puts section_1 + "-" + section_2 + "-" + section_3 + "-" + section_4 + "-" + section_5
end

uuid

# 5.________________________________________________

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
