def part1
  bags = {}

  File.open('input').each_line do |line|
    outer_bag, inner_bags = line.chomp.split(' bags contain ')
    inner_bags = inner_bags.split(',').map { |bag| bag.scan(/\d+ ([a-z ]+) bag/) }
    bags[outer_bag] = inner_bags.flatten
  end

  outer_bags = bags.select { |k, v| v.include? 'shiny gold' }.keys
  all_valid = outer_bags

  until outer_bags.empty?
    outer_bags = outer_bags.map do |bag|
      bags.select { |k, v| v.include? bag }.keys
    end.flatten.uniq
    all_valid += outer_bags
  end

  all_valid.uniq.length
end

def part2
  bags = {}

  File.open('input').each_line do |line|
    outer_bag, inner_bags = line.chomp.split(' bags contain ')
    inner_bags = inner_bags.split(',').map { |bag| bag.scan(/(\d+ [a-z ]+) bag/) }
    bags[outer_bag] = inner_bags.flatten.map { |bag| [bag[2..-1], bag.to_i] }
  end

  traverse(bags, bags['shiny gold'])
end

def traverse(bags, bag)
  return 0 if bag.empty?

  bag.map do |k, v|
    puts [bag, k, v].inspect
    v + (v * traverse(bags, bags[k]))
  end.sum
end

puts part1
puts part2
