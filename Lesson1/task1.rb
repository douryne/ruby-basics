print "Enter your name, please: "

name = gets.chop

print "Enter your height, please: "

height = gets.to_f

result = (height - 110) * 1.15

if result <= 0
  puts "#{name}, your weight is already perfect"
else
  puts "#{name}, your perfect weight is #{result}"
end
