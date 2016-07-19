names = ['kim', 'joe', 'sam']

names.each_with_index do|_, a|
  puts "#{a+1}. got a name!"
end