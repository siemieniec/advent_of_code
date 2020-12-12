def part1
  directions = ['E', 'S', 'W', 'N']
  actions = File.read("input").scan(/([NESWLRF])(\d+)/)
  location = [0, 0]

  actions.each do |dir, val|
    val = val.to_i
    dir = directions.first if dir == 'F'

    case dir
    when 'L'
      directions.rotate!(-val / 90)
    when 'R'
      directions.rotate!(val / 90)
    when 'N'
      location[1] += val
    when 'E'
      location[0] += val
    when 'S'
      location[1] -= val
    when 'W'
      location[0] -= val
    end
  end

  location.map(&:abs).sum
end

def part2
  actions = File.read("input").scan(/([NESWLRF])(\d+)/)
  location = [0, 0]
  waypoint = [10, 1]

  actions.each do |dir, val|
    val = val.to_i
    case dir
    when 'F'
      location[0] += val * waypoint[0]
      location[1] += val * waypoint[1]
    when 'L'
      ((val / 90) % 4).times { waypoint = [-waypoint[1], waypoint[0]] }
      end
    when 'R'
      ((val / 90) % 4).times { waypoint = [waypoint[1], -waypoint[0]] }
    when 'N'
      waypoint[1] += val
    when 'E'
      waypoint[0] += val
    when 'S'
      waypoint[1] -= val
    when 'W'
      waypoint[0] -= val
    end
  end

  location.map(&:abs).sum
end

puts part1
puts part2
