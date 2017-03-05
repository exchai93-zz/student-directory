# The filename we use to save and load data (menu items 3 and 4) is hardcoded.
# Make the script more flexible by asking for the filename if the user chooses these menu items.

@students = [] # an empty array accessible to all methods

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

def menu_process(selection)
  feedback = "Option #{selection} completed!"
  case selection
    when "1"
      puts "You have chosen to input the students."
      input_students
      puts feedback
    when "2"
      puts "You have chosen to show the students."
      show_students
      puts feedback
    when "3"
      puts "You have chosen to save this list."
      save_students
      puts feedback
    when "4"
      puts "You have chosen to load the list."
      load_students
      puts feedback
    when "9"
      puts "Goodbye!"
      exit
      puts feedback
    else
      puts "Please choose an option from the menu."
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

# updated save method, get rid of default value
def save_students
  puts "Which file would you like to save to?"
  # get user input and store it in file_name variable
  file_name = STDIN.gets.chomp
  file = File.open(file_name, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Saving students..!"
  file.close
end

# updated load method
def load_students(file_name = "students.csv")
  puts "Which file would you like to load from?"
  file_name = STDIN.gets.chomp
  file = File.open(file_name, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    add_students
end
  puts "Loading students..!"
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
    @students << {name: :@name, cohort: :november}
end

try_load_students
interactive_menu
