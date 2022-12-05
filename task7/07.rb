def expanded_size(code)
  size = 0
  if code =~ /\(((\d+)x(\d+))\)/
    size += $`.size
    to_decode = $'[0...$2.to_i]
    size += $3.to_i * expanded_size(to_decode) + expanded_size($'[$2.to_i..-1])
  else
    code.size
  end
end

File.read('07.txt').each_line do |line|
  line.chomp!

  puts expanded_size(line)
end
