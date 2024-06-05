def find_discriminant(a, b, c)
  return b**2 - (4*a*c)
end

def calculate_roots(a, b, c, discriminant)
  sqrt_discriminant = Math.sqrt(discriminant)

  if discriminant > 0
    x1 = (-b + sqrt_discriminant) / 2*a
    x2 = (-b - sqrt_discriminant) / 2*a
    puts "x1 is #{x1}"
    puts "x2 is #{x2}"
  elsif discriminant == 0
    x = -b / 2*a
    puts "There is only one root #{x}"
  end
end

print "Enter first value: "
a = gets.to_f

print "Enter second value: "
b = gets.to_f

print "Enter third value: "
c = gets.to_f

discriminant = find_discriminant(a, b, c)

if discriminant < 0
  puts "There is no roots"
else
  calculate_roots(a, b, c, discriminant)
end
