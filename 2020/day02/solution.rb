def part1
  File.open("input").each_line.map do |line|
    min, max, letter, password = line.chomp.scan(/^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$/).first

    occurrences = password.scan(letter).length

    occurrences.between?(min.to_i, max.to_i) ? 1 : 0
  end.sum
end

def part2
  File.open("input").each_line.map do |line|
    first, second, letter, password = line.chomp.scan(/^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$/).first

    first_match = password[first.to_i - 1] == letter
    second_match = password[second.to_i - 1] == letter

    first_match ^ second_match ? 1 : 0
  end.sum
end

puts part1
puts part2
