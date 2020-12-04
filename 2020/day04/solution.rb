def part1
  mandatory = %w(byr iyr eyr hgt hcl ecl pid).sort
  passports = File.read("input").split("\n\n")
  passports.map do |passport|
    keys = passport.split(/\s/).map { |data| data.split(":").first }.sort
    (keys & mandatory) == mandatory ? 1 : 0
  end.sum
end

def part2
  validate_byr = ->(x) { x.key?("byr") && /^[0-9]{4}$/.match?(x["byr"]) && (1920..2002).include?(x["byr"].to_i) }
  validate_iyr = ->(x) { x.key?("iyr") && /^[0-9]{4}$/.match?(x["iyr"]) && (2010..2020).include?(x["iyr"].to_i) }
  validate_eyr = ->(x) { x.key?("eyr") && /^[0-9]{4}$/.match?(x["eyr"]) && (2020..2030).include?(x["eyr"].to_i) }
  validate_hgt = ->(x) do
    x.key?("hgt") &&
      ((x["hgt"].end_with?("cm") && (150..193).include?(x["hgt"].to_i)) ||
       (x["hgt"].end_with?("in") && (59..76).include?(x["hgt"].to_i)))
  end
  validate_hcl = ->(x) { x.key?("hcl") && /^#[0-9a-f]{6}$/.match?(x["hcl"]) }
  validate_ecl = ->(x) { x.key?("ecl") && /^amb|blu|brn|gry|grn|hzl|oth$/.match?(x["ecl"]) }
  validate_pid = ->(x) { x.key?("pid") && /^[0-9]{9}$/.match?(x["pid"]) }

  passports = File.read("input").split("\n\n")
  passports = passports.map do |passport|
    passport.split(/\s/).map { |data| data.split(":") }.to_h
  end

  passports.map do |p|
    validate_byr.call(p) &&
      validate_iyr.call(p) &&
      validate_eyr.call(p) &&
      validate_hgt.call(p) &&
      validate_hcl.call(p) &&
      validate_ecl.call(p) &&
      validate_pid.call(p) ? 1 : 0
  end.sum
end

puts part1
puts part2
