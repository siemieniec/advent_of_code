def part1(ops)
  acc = pos = 0
  visited = []

  until visited.include?(pos)
    visited << pos
    op, offset = ops[pos]
    case op
    when "acc"
      acc += offset.to_i
      pos += 1
    when "jmp"
      pos += offset.to_i
    else
      pos += 1
    end

    return "P2: #{acc}" if pos >= ops.length
  end

  "P1: #{acc}"
end

def part2(ops)
  ops.each_with_index do |op, i|
    case op[0]
    when 'jmp'
      xops = ops.dup
      xops[i] = ['nop', xops[i][1]]
      result = part1(xops)
      return result if result.start_with?("P2")
    when 'nop'
      xops = ops.dup
      xops[i] = ['jmp', xops[i][1]]
      result = part1(xops)
      return result if result.start_with?("P2")
    end
  end
end

ops = File.read("input").split("\n").map { |x| x.split(" ") }
puts part1(ops)
puts part2(ops)
