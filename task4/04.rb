data = File.read('04.txt').strip

grid = Hash.new(0)

data.each_line do |line|
  m = line.match(/(\d+),(\d+) through (\d+),(\d+)/)
  x1, y1, x2, y2 = m.captures.map(&:to_i)

  # все включающиеся лампочки
  lights = (x1..x2).to_a.product((y1..y2).to_a)

  case line
  when /toggle/
    lights.each { |light| grid[light] += 2 }
  when /turn off/
    lights.each { |light| grid[light] = [ 0, grid[light].pred ].max }
  when /turn on/
    lights.each { |light| grid[light] += 1 }
  end
end

puts grid.values.inject(:+)
