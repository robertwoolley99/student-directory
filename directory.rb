#  Let's put all students into a hash

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please enter name of student."
  name = gets.chomp
  puts "Please enter country of birth"
  country_of_birth = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, country: country_of_birth, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter name of student."
    name = gets.chomp
    if !name.empty? 
      puts "Please enter country of birth"
    end
    country_of_birth = gets.chomp
  end
  # return the array of students
  students
end

def print_header
puts "The students of my cohort at Makers Academy"
puts "------------"
end

def print(students)
  puts "If you want to filter by length of name, enter the maximum number of characters. Otherwise, just enter 0."
  filter = gets.chomp
  if filter == "0"
    length  = 0
  else
  filter = filter.to_i
  length  = 1
  end

  if length  == 0
    i = 0
    while i < students.length
      indexplusone = i+1  
      puts "#{indexplusone}  #{students[i][:name]} from  #{students[i][:country]} (#{students[i][:cohort]} cohort)".center(60)
      i += 1
    end
  elsif length  == 1
    i = 0
    while i < students.length 
      indexplusone = i+1
      slice = students[i][:name]
      filter_slice = slice.delete(" ")
        if filter_slice.length <= filter 
          puts "#{indexplusone}  #{students[i][:name]} from  #{students[i][:country]}  (#{students[i][:cohort]} cohort)".center(60)
          i += 1
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

