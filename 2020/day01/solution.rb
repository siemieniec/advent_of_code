def part1
  entries = File.read("input").split("\n").map(&:to_i).sort

  entries.combination(2).each do |x, y|
    return x * y if x + y == 2020
  end
end

def part2
  entries = File.read("input").split("\n").map(&:to_i).sort

  entries.combination(3).each do |x, y, z|
    return x * y * z if x + y + z == 2020
  end
end

puts part1
puts part2
