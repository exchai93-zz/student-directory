# Save data to a file

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
  puts "9. Exit" # 9 because we'll be adding more items
end

# extract the code that prints the students into a method
def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  # processing one student at a time
  @students.each do |student|
    # on every iteration we create a new array with the student name and cohort
    # i.e. the information we want to save to the file
    student_data = [student[:name], student[:cohort]]
    # convert array into a comma separated string
    # join() method joins all elements of the array it's called together
    csv_line = student_data.join(",")
    # write the csv line to the file using puts()
    # call it on a file so it writes to the file and not on the screen
    file.puts csv_line
  end
  # every file that is opened needs to be closed
  file.close
end
# ^^^^^^
# on every iteration we want to write a line like: Name, Cohort
# currently data is stored in a hash, therefore need to convert hash to a string to write to the file
# put all elements of the hash into an array, then convert to a string
# see line 11: create an array
# see line 14: join it all together using comma as a separator


# extract code of the case statement that decides what to do based on what the user entered
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
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
