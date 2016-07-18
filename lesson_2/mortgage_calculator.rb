# MORTGAGE CALCULATOR:

# The following formula is used to calculate the fixed monthly payment (P) required to fully
# amortize a loan of L dollars over a term of n months at a monthly interest rate of c. 
# [If the quoted rate is 6%, for example, c is .06/12 or .005]

# EQUATION: P = L[c(1 + c)**n]/[(1 + c)**n - 1] 
# P = fixed monthly payment
# L = loan amount
# c = interest rate
# n = months

# USER INPUT:
# amt. of the loan
# annual percentage rate (APR)
# loan duration

# CALCULATOR WILL FIND THE MONTHLY MORTGAGE PAYMENT & LOAN DURATION IN MONTHS

require 'pry'

def prompt(message)
  puts "=========="
  puts message
  puts "=========="
end

prompt("Welcome to the mortgage calculator! \r\nthis calculator was designed to help people find out \r\nthe monthly interest rate and loan duration (in months). \r\n")

answer = "yes"
while answer == "yes"

  puts "Please enter the following information:"

  puts "The loan amount:"
  l_amount = ''
  loop do 
    l_amount = gets.chomp
    if l_amount.to_i <= 0 || l_amount.empty?
      puts "enter a positive number."
    else
      l_amount = l_amount.to_i
      break
    end
  end

  puts "The Annual Percentage Rate (APR)"
  apr = ''
  loop do 
    apr = gets.chomp
    if apr.to_f <= 0 || apr.empty?
      puts "enter a positive number."
    else
      apr = apr.to_f
      break
    end
  end

  puts "The loan duration in years"
  l_duration = ''
  loop do 
    l_duration = gets.chomp
    if l_duration.to_i <= 0 || l_duration.empty?
      puts "enter a positive number."
    else
      l_duration = l_duration.to_i
      break
    end
  end

  #calculate interest rates and monthly mortgage payments
  duration_months = l_duration * 12
  annual_interest_rate = apr / 100
  monthly_interest_rate = annual_interest_rate / 12
  monthly_payment = l_amount * (monthly_interest_rate * (1 + monthly_interest_rate)**duration_months) / ((1 + monthly_interest_rate)**duration_months - 1)

  #calculate how long it will take them pay off loan in months
  duration_pay_off  = l_amount / monthly_payment

  puts "Your monthly payment is: $#{monthly_payment.to_i} and it will take you #{duration_pay_off.to_i} months to pay off your loan."
    
  prompt("Would you like to run another calculation? Answer 'yes' or 'no'")
  answer = gets.chomp.downcase
end

puts "thanks for playing! Goodbye!"

