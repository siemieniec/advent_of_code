def part1
  bag = File.read("input").split("\n").map(&:to_i).sort
  bag = bag.prepend(0).push(bag.max + 3)

  jump_by_one = bag.each_cons(2).select { |x, y| x + 1 == y }.length
  jump_by_three = bag.each_cons(2).select { |x, y| x + 3 == y }.length

  jump_by_one * jump_by_three
end

def part2
  # TODO: Find a better way than calculating it on paper.
  #       Tip: Next number is a sum of previous three.
  steps = [0, 1, 1, 2, 4, 7, 13, 24]

  bag = File.read("input").split("\n").map(&:to_i).sort
  bag = bag.prepend(0)
  bag = bag.slice_when { |x, y| y - x == 3 }.to_a
  bag.map { |x| steps[x.length] }.inject(&:*)
end


puts part1
puts part2
