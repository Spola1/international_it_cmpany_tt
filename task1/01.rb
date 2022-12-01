input = File.read('01.txt').chars

i = 0

input.each do |el|
  if el == '('
    i += 1
  elsif el == ')'
    i -= 1
  end
end

puts i
