# Санта доставляет подарки в бесконечную двумерную сетку домов.
# Он начинает с того, что доставляет подарок в дом в его исходном местоположении,
# а затем эльф на Северном полюсе звонит ему по радио и говорит, куда двигаться дальше.
# Ходы всегда ровно на один дом на север (^), юг (v), восток (>) или запад (<).
# После каждого переезда он доставляет еще один подарок в дом на своем новом месте.
# Однако эльф на северном полюсе перебрал гоголь-моголя, и поэтому его указания немного сбились,
# и Санта в итоге посещает некоторые дома несколько раз. Сколько домов получат хотя бы один подарок?

data = File.read('03.txt')[0..-2]

def find_coordinates(input)
  case input
  when "^"
    position = [0,1]
  when "v"
    position = [0,-1]
  when ">"
    position = [1,0]
  when "<"
    position = [-1,0]
  end
end

data_array = data.split("")

coordinates_array = [[0,0]]

santa_visits = data_array.values_at(* data_array.each_index.select {|i| i.even?})
robot_visits = data_array.values_at(* data_array.each_index.select {|i| i.odd?})

santa_coordinates_array = [[0,0]]
robot_coordinates_array = [[0,0]]

santa_visits.each do |i|
  each_coordinate = find_coordinates(i)

  new_coordinates = [each_coordinate, santa_coordinates_array.last].transpose.map {|a| a.inject(:+)}
  santa_coordinates_array.push(new_coordinates)
end

robot_visits.each do |i|
  each_coordinate = find_coordinates(i)

  new_coordinates = [each_coordinate, robot_coordinates_array.last].transpose.map {|a| a.inject(:+)}
  robot_coordinates_array.push(new_coordinates)
end

everyones_visits = santa_coordinates_array += robot_coordinates_array

puts everyones_visits.size
puts everyones_visits.uniq.size
