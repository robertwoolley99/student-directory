@students = [] # an empty array accessible to all methods

@filename = "" # global variable for filename

@start = 0 # flag for first time run

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list "
  puts "4. Load the list "
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students(@filename)
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter the filename to save to. If you enter nothing, then the default of students.csv will be used."
  @filename = STDIN.gets.chomp
  if @filename.empty?
  @filename = "students.csv"
  end
  # open the file for writing
  File.open(@filename, "w") do |file|
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  end 
end

def load_students(filename)
  if @start == 1    
    if filename.empty?
    puts "Enter filename to load from.  If you enter nothing, then default of students.csv will be used."
    filename = STDIN.gets.chomp
      if filename.empty?
        filename = "students.csv"
       end
    end
  end
  File.open(filename, "r") do |file|  
  file.readlines.each do |line| 
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  end
  puts "File loaded."
end

def try_load_students
  @filename = ARGV.first# first argument from the command line
  if @filename.nil?
    @filename = "students.csv"
    if !File.exists?(@filename)
    puts "Setting the working file to students.csv."
      return
    end
  end
  return if @filename.nil? # get out of the method if it isn't given
  if File.exists?(@filename) # if it exists
    load_students(@filename)
     puts "Loaded #{@students.count} students from #{@filename}"
  else # if it doesn't exist
    puts "Sorry, #{@filename} doesn't exist."
    exit 
  end
end

try_load_students
@start = 1
interactive_menu
