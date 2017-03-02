# loading procedure is going to be the reverse of what we've done to save the data to the file
# 1. open file for reading
# 2. read contents of the file
# 3. iterate over all lines
# 4. split every line at the comma
# 5. put a new hash into the array @students
# 6. close the file

@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# extract the code that prints the menu into its own method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  # add one more menu item to save the students
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

# extract the code that prints the students into a method
def show_students
  print_header
  print_students_list
  print_footer
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

# loading data from the file
def load_students
  # open file for reading
  file = File.open("students.csv", "r")
  # read all lines into an array and interate over it
  file.readlines.each do |line|
  # on every interation discard the trailing new line char from the line
  # split it at the comma (this gives us an array with two elements)
  # assign it to the name and cohort varibales
  name, cohort = line.chomp.split(',')
    # create a new hash and put it into the array of students
    # converting a string from the file to a symbol
    @students << {name: name, cohort: cohort.to_sym}
  end
  # close the file
  file.close
end

def process(selection)
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
      puts "I don't know what you mean, try again"
    end
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

interactive_menu
