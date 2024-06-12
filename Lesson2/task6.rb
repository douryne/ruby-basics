@products = {}

def calculate_product_cost(product)
  product["price"] * product["amount"]
end

def calculate_basket_cost(products)
  costs_arr =  []
  products.each_value {|product| costs_arr.append(calculate_product_cost(product))}
  costs_arr.sum
end

loop do
  puts "Enter the product name"
  product_name = gets.chomp
  break if product_name == "stop"
  puts "Enter the product price"
  price = gets.to_f
  puts "Enter the amount of product"
  amount = gets.to_f

  product_info = { "price" => price, "amount" => amount }
  @products.store(product_name, product_info)
end

puts @products

@products.each {|product_name, product_info| puts "name: #{product_name}, cost: #{calculate_product_cost(product_info)}"}

puts calculate_basket_cost(@products)
