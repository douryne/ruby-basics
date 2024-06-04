def right_triangle?(sides)
  sorted_sides = sides.sort

  hypotenuse = sorted_sides.last
  side1 = sorted_sides[0]
  side2 = sorted_sides[1]

  return hypotenuse**2 == (side1**2 + side2**2)
end

def equilateral_triangle?(sides)
  return sides.uniq.length == 1
end

def isosceles_triangle?(sides)
  return sides.uniq.length == 2
end

print "Enter value of the first side of the triangle: "
a = gets.to_f

print "Enter value of the second side of the triangle: "
b = gets.to_f

print "Enter value of the third side of the triangle: "
c = gets.to_f

triangle_sides = [a, b, c]

if equilateral_triangle?(triangle_sides)
  puts "The triangle is equilateral"
else
  puts "The triangle is not equilateral"
end

if equilateral_triangle?(triangle_sides) || isosceles_triangle?(triangle_sides)
  puts "The triangle is isosceles"
else
  puts "The triangle is not isosceles"
end

if right_triangle?(triangle_sides)
  puts "The triangle is right"
else
  puts "The triangle is not right"
end