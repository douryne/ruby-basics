@months = { "january" => 31, "february" => 28, "march" => 31, "april" => 30, "may" => 31, "june" => 30, "july" => 31, "august" => 31, "september" => 30, "october" => 31, "november" => 30, "december" => 31 }

def get_date_counter(day, month, year)
  @months["february"] = 29 if leap_year?(year)
  puts leap_year?(year)
  days_count = @months.values[0...(month - 1)].sum
  return month == 1 ? day : days_count + day
end

def leap_year?(year)
  return true if year % 4 == 0
  return false if year % 100 != 0
  year % 400 == 0
end

puts "Enter the days value"
day = gets.to_i
puts "Enter the months value"
month = gets.to_i
puts "Enter the years value"
year = gets.to_i

puts get_date_counter(day, month, year)