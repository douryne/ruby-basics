vowels_letters = ["a", "e", "i", "o", "u"]
final_hash = {}

("a"..."z").to_a.each_with_index do |element, index|
  final_hash[element] = index+1 if vowels_letters.include?(element)
end

puts final_hash