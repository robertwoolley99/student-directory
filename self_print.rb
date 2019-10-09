file = $0

puts "This file is called #{file}"

a = File.open(file, "r")
a.readlines.each do |output|
  puts output
end
