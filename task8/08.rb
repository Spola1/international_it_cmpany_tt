# найти все уникальные строки (без повторяющихся слов)

input = File.read('08.txt').split(/\n/)

i = 0

input.each do |el|
  el.split.size == el.split.uniq.size ? i += 1 : i += 0
end

puts i
