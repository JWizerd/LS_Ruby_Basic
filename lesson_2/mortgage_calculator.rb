# MORTGAGE CALCULATOR:

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
  puts "==== #{message}"
end

def valid_input?
  loop do
    val = gets.chomp
    if val.to_f <= 0 || val.empty?
      prompt('enter a positive number.')
    else
      return val.to_f
    end
  end
end

def calculate_monthly_payments(months, interest, amount)
  # calculate interest rates and monthly mortgage payments
  monthly_payment = amount.to_f * (interest * (1 + interest)**months.to_i) / ((1 + interest)**months - 1)
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
end

prompt("Welcome to the mortgage calculator!")
prompt("this calculator was designed to help people find out")
prompt("the monthly interest rate and loan duration (in months).")

answer = "yes"
while answer == "yes"

  puts "\r\nPlease enter the following information:"

  puts "The loan amount:"
  loan_amount = valid_input?

  puts "The Annual Percentage Rate (APR)"
  apr = valid_input?

  puts "The loan duration in years"
  loan_duration = valid_input?

  # calculate interest rates and monthly mortgage payments
  duration_months = loan_duration * 12
  interest_rate = (apr.to_f / 100) / 12
  calculate_monthly_payments(duration_months, interest_rate, loan_amount)

  puts "\r\nWould you like to run another calculation? Answer 'yes' or 'no'"
  answer = gets.chomp.downcase
end

puts "thanks for playing! Goodbye!"
