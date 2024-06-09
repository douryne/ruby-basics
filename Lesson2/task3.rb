arr = [0, 1]

loop do
  new_number = arr[-1] + arr[-2]
  new_number <= 100 ? arr.push(new_number) : break
end

puts arr
