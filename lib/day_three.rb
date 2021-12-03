data = File.readlines('./input/binary_diagnostic.txt', chomp: true)
# data = File.readlines('./input/binary_diagnostic_test.txt', chomp: true)

lines = data.length
line_length = data.first.length

array = Array.new(line_length) { 0 }

data.each do |line|
  line.split('').each_with_index do |char, index|
    array[index] += char.to_i
  end
end

gamma_array = array.map { |x| x > lines / 2 ? 1 : 0 }
epsilon_array = gamma_array.map { |x| x.zero? ? 1 : 0 }

gamma = gamma_array.join('').to_i(2)
epsilon = epsilon_array.join('').to_i(2)

puts "Gamma: #{gamma}"
puts "Epsilon: #{epsilon}"

puts "Power consumption: #{gamma * epsilon}"

########################################################################

oxygen_data = data.dup
scrubber_data = data.dup

(0..line_length - 1).each do |i|
  sum = 0
  oxygen_data.map do |line|
    sum += line[i].to_i
  end

  keep = sum >= oxygen_data.length / 2.0 ? 1 : 0

  oxygen_data.filter! do |line|
    line[i] == keep.to_s
  end

  break if oxygen_data.length == 1
end

oxygen = oxygen_data.join('').to_i(2)
puts "Oxygen: #{oxygen}"

(0..line_length - 1).each do |i|
  sum = 0
  scrubber_data.map do |line|
    sum += line[i].to_i
  end

  keep = sum >= scrubber_data.length / 2.0 ? 0 : 1

  scrubber_data.filter! do |line|
    line[i] == keep.to_s
  end

  break if scrubber_data.length == 1
end

scrubber = scrubber_data.join('').to_i(2)
puts "Scrubber: #{scrubber}"

puts "Live support rating: #{oxygen * scrubber}"
