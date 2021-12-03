data = File.readlines('./input/move.txt').map(&:split)
# data = File.readlines('./input/move_test.txt').map(&:split)

horizontal = 0
depth = 0

data.each do |dir, val|
  case dir
  when 'forward'
    horizontal += val.to_i
  when 'down'
    depth += val.to_i
  when 'up'
    depth -= val.to_i
  end
end

# puts horizontal
# puts depth

# puts horizontal * depth

########################################################################

horizontal = 0
depth = 0
aim = 0

data.each do |dir, val|
  case dir
  when 'forward'
    horizontal += val.to_i
    depth += aim * val.to_i
  when 'down'
    aim += val.to_i
  when 'up'
    aim -= val.to_i
  end
end

puts horizontal
puts depth

puts horizontal * depth
