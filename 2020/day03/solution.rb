def part1(step_x, step_y)
  forest = File.open("input").readlines.map { |line| line.chomp.chars }
  width = forest.first.length
  x = y = trees = 0

  while y < forest.length
    trees += 1 if forest[y][x] == '#'
    x = (x + step_x) % width
    y += step_y
  end

  trees
end

def part2
  [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map do |x, y|
    part1(x, y)
  end.inject(&:*)
end

puts part1(3, 1)
puts part2
