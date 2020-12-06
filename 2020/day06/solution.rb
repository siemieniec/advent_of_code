def part1
  File.read("input").split("\n\n").map do |group|
    answers = group.split("\s").map { |x| x.chars }
    answers.inject([]) { |sum, x| sum = sum | x }.length
  end.sum
end

def part2
  File.read("input").split("\n\n").map do |group|
    answers = group.split("\s").map { |x| x.chars }
    answers.inject(('a'..'z').to_a) { |sum, x| sum = sum & x }.length
  end.sum
end

puts part1
puts part2
