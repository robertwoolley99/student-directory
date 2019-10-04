#  Let's put all students into a hash

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  puts "Enter the default month for the cohort"
  default_cohort = gets.chomp
  # create an empty array
  students = []
  # get the first name
  puts "Please enter name of student."
  name = gets.chomp
  puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
      if cohort.empty?
      cohort = default_cohort
    end
    students << {name: name, cohort: cohort}
    if students.count == 1 
      puts "Now we have 1 student."
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Please enter name of student."
    name = gets.chomp
    if !name.empty? 
      puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
    end
    cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
puts "The students by cohort at Makers Academy"
puts "------------"
end

def print(students)

    cohort_list = []
    
    students.each do | x |
    cohortx = "#{x[:cohort]}"
    cohort_list.push(cohortx)
    end

    cohort_list.uniq!

      cohort_list.each do | x |

      puts "Students in #{x} cohort"

      students.each_with_index do | y, index |
        check = "#{y[:cohort]}"
        if check == x 
          indexplusone = index + 1
          puts "#{indexplusone} #{y[:name]}"
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

