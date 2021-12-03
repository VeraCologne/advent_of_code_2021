data = File.read('./input/submarine.txt').split.map(&:to_i)
# data = File.read('./input/submarine_test.txt').split.map(&:to_i)

increases = 0

data.each_cons(2) do |x, y|
  increases += 1 if y > x
end

puts "first part: #{increases}"

increases = 0

sum = data.each_cons(3).map(&:sum)

sum.each_cons(2) do |x, y|
  increases += 1 if y > x
end

puts "second part: #{increases}"
