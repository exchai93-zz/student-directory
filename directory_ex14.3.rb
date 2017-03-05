# Continue refactoring the code. Which method is a bit too long?
# What method names are not clear enough?
# Anything else you'd change to make your code look more elegant? Why?

@students = [] # an empty array accessible to all methods

# updated print_menu to avoid 'puts' repetition
def print_menu
menu = <<END
  1. Input the students
  2. Show the students
  3. Save the list to students.csv
  4. Load the list from students.csv
  9. Exit
END
puts menu
end

def interactive_menu
  loop do
    print_menu
    menu_process(STDIN.gets.chomp)
  end
end

# changed function name from 'process' to 'menu_process' for clarity
def menu_process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      "Please choose an option from the menu."
    end
end

def input_students
  puts "Please enter the names of the students."
  puts "To finish, just hit return twice."
  @name = STDIN.gets.chomp
  while !@name.empty? do
    add_students
    puts "Now we have #{@students.count} students"
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students."
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  @name, cohort = line.chomp.split(',')
  add_students
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "Loaded #{@students.count} from students.csv."
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_students
    @students << {name: @name, cohort: :november}
end

try_load_students
interactive_menu
