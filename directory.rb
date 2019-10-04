@students = []


def interactive_menu
  students = []
  puts "hello"
  loop do
# 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "9. Exit" # 9 because we'll be adding more items
# 2. read the input and save it into a variable
    selection = gets.chomp
# 3. do what the user has asked
    case selection
    when "1"
    input_students
    when "2"
    print_header
    print
    print_footer
    when "3" # save student details to students.csv
    save_students
    when "9"
    exit # this will cause the program to terminate
    else
    puts "I don't know what you meant, try again"
    end
  end
end
#                                                                             #                     



#  Let's put all students into a hash

def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  puts "Enter the default month for the cohort"
  default_cohort = gets.slice(0..-2)
  puts "Default cohort is #{default_cohort}"
  # get the first name
  puts "Please enter name of student."
  name = gets.slice(0..-2)
  puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
  cohort = gets.slice(0..-2)
  # while the name is not empty, repeat this code
  while !name.empty? do
      if cohort.empty?
      cohort = default_cohort
    end
    @students << {name: name, cohort: cohort}
    if @students.count == 1 
      puts "Now we have 1 student."
    else
      puts "Now we have #{@students.count} students."
    end
    # get another name from the user
    puts "Please enter name of student."
    name = gets.slice(0..-2)
    if !name.empty? 
      puts "Please enter the month of the cohort.  If you enter a blank, then we will use the default value of #{default_cohort}"
    end
    cohort = gets.slice(0..-2)
  end
end

def print_header
puts "The students by cohort at Makers Academy"
puts "------------"
end

def print

    cohort_list = []
    
    @students.each do | x |
    cohortx = "#{x[:cohort]}"
    cohort_list.push(cohortx)
    end

    cohort_list.uniq!

      cohort_list.each do | x |

      puts "Students in #{x} cohort"

      @students.each_with_index do | y, index |
        check = "#{y[:cohort]}"
        if check == x 
          indexplusone = index + 1
          puts "#{indexplusone} #{y[:name]}"
        end
      end
    end
end


def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# routine to save data
def save_students
# open the file to save
  file = File.open("students.csv", "w")
# iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end






# nothing happens until we call the methods
interactive_menu

#students = input_students
#print_header
#print(students)
#print_footer(students)

