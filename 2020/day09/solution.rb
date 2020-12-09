def part1
  xmas = File.read("input").split("\n").map(&:to_i)
  xmas.each_cons(25).with_index do |chunk, i|
    return xmas[i + 25] unless chunk.combination(2).map(&:sum).include?(xmas[i + 25])
  end
end

def part2
  encryption_weakness = part1

  xmas = File.read("input").split("\n").map(&:to_i)
  (2..xmas.length).each do |size|
    xmas.each_cons(size) do |chunk|
      return chunk.min + chunk.max if chunk.sum == encryption_weakness
    end
  end
end

puts part1
puts part2
