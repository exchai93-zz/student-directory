def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = $stdin.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get user input about more information?
    puts "Now enter this student's country of birth: "
    country = $stdin.gets.chomp
    puts "Now enter this student's hobbies: "
    hobbies = $stdin.gets.chomp
    puts "Now enter this student's height: "
    height = $stdin.gets.chomp
    # add the student hash to the array
    students << {name: name, country: country, hobbies: hobbies, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Now enter another student's name (or press enter to finish)"
    name = $stdin.gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end

def print(students)
  students.each_with_index do |student, i|
      puts "#{i + 1} #{student[:name]} is from #{student[:country]} and is #{student[:height]} tall. Hobbies include #{student[:hobbies]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
