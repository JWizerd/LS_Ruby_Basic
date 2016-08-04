# Write a method that takes two arguments: the first is the starting number, 
# and the second is the ending number. Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz", and finally 
# if a number is divisible by 3 and 5 print "FizBuzz".


a = * (1..1000)

def fizz_buzz(fizz, buzz)
  a = * (fizz...buzz)
  a.each do |number|
    if number % 3 == 0 && number % 5 != 0
      puts "Fizz"
    elsif number % 5 == 0 && number % 3 != 0
      puts "Buzz"
    elsif number % 3 == 0 && number % 5 == 0
      puts "Fizz Buzz"
    else 
      puts number
    end
  end
end