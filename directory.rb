#  Let's put all students into a hash

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
puts "The students of my cohort at Makers Academy"
puts "------------"
end

def print(students)
  puts "If you want to filter by length of name, enter the number of characters. Otherwise, just enter 0."
  filter = gets.chomp
  if filter == "0"
    length  = 0
  else
  filter = filter.to_i
  length  = 1
  end

  if length  == 0
    students.each_with_index do |student, index|
      indexplusone = index+1  
      puts "#{indexplusone}  #{student[:name]} (#{student[:cohort]} cohort)"
    end
  elsif length  == 1
  students.each_with_index do |student, index|
      indexplusone = index+1
      slice = student[:name]
      filter_slice = slice.delete(" ")
        if filter_slice.length <= filter 
          puts "#{indexplusone}  #{student[:name]} (#{student[:cohort]} cohort)"
        end
    end
  end

 





end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

