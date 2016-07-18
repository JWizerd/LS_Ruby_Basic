# ask the user for two numbers
# ask the user for operation to perform + - * /
# perform the operation on the two numbers
# output the results

def prompt(message)
  puts("=> #{message}")
end

prompt('Welcome to CalculatorFunTimes!')

answer = 'yes'
while answer == 'yes'

  def valid_number?(num)
    num.to_i != 0
  end

  number1 = ''
  number2 = ''

  loop do
    prompt("please enter a number")
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("that's not a valid number")
    end
  end

  loop do
    prompt("please enter another number")
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("please enter a valid number")
    end
  end

  prompt("what operation would you like to perform with these numbers?")
  prompt("please enter one of the following: + - * /")

  loop do
    operation = gets.chomp
    if operation.include?('+') || operation.include?('-') || operation.include?('*') || operation.include?('/')

      result =  case operation
                when '+'
                  number1.to_i + number2.to_i
                when '-'
                  number1.to_i - number2.to_i
                when '*'
                  number1.to_i * number2.to_i
                when '/'
                  number1.to_f / number2.to_f
                end

      prompt("result = #{result}")
      break
    else
      prompt("please enter a valid operation")
    end
  end
  prompt("play again?")
  answer = gets.chomp.to_s.downcase

end

prompt("Thanks for playing! Goodbye!")
