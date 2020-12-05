def part1
  File.open('input').each_line.map do |line|
    row = line[0..6].gsub(/\w/, { 'B' => 1, 'F' => 0 }).to_i(2)
    column = line[7..-1].gsub(/\w/, { 'R' => 1, 'L' => 0 }).to_i(2)
    row * 8 + column
  end.max
end

def part2
  bookings = File.open('input').each_line.map do |line|
    row = line[0..6].gsub(/\w/, { 'B' => 1, 'F' => 0 }).to_i(2)
    column = line[7..-1].gsub(/\w/, { 'R' => 1, 'L' => 0 }).to_i(2)
    row * 8 + column
  end.sort

  (bookings[0]..bookings[-1]).to_a - bookings
end

puts part1
puts part2
