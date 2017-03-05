# We are in fact using CSV format to store data.
# However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files.
# Refactor the code to use this library.

# Modify save method

# access csv library
require 'csv'

@students = []

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
    if @students.count > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have #{@students.count} student."
    end
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
 @students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
 end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students."
  else
    puts "Overall, we have #{@students.count} great student."
  end
end

# updated save method
def save_students
  puts "Which file would you like to save to?"
  file_name = STDIN.gets.chomp
  CSV.open("students.csv", "w") do |csv| # CSV format
    @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv << student_data
  end
  end
  puts "Saving students..!"
end

# updated load method
def load_students(filename = "students.csv")
  puts "Which file would you like to load from?"
  file_name = STDIN.gets.chomp
  CSV.foreach(file_name, "r") do |name, cohort| # CSV format: does chomp and split automatically
    add_students
  end
  puts "Loading students..!"
end


def try_load_students
  filename = ARGV.first
  if filename.nil? 
    load_students("students.csv")
    puts "Loaded #{@students.count} students from students.csv."
  elsif File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} students from #{filename}."
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def add_students
  @students << {name: @name, cohort: :november}
end

try_load_students
interactive_menu
