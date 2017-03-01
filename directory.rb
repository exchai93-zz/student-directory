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
    puts "Now enter the cohort of this student: "
    # convert input from string to a symbol
    cohort = $stdin.gets.chomp.downcase.to_sym
    # inputs to be expected
    cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    # if input is empty give a default value
    if cohort.empty?
      cohort = :november
    # if cohort does not include any of the values listed in cohorts, try again until it does 
    elsif !cohorts.include? cohort
        until cohorts.include? cohort
          puts "Invalid cohort. Try again."
          cohort = $stdin.gets.chomp.downcase.to_sym
        end
    end
    puts "Now enter this student's country of birth: "
    country = $stdin.gets.chomp
    puts "Now enter this student's hobbies: "
    hobbies = $stdin.gets.chomp
    puts "Now enter this student's height: "
    height = $stdin.gets.chomp
    # add the student hash to the array
    students << {name: name, country: country, hobbies: hobbies, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Now enter another student's name (or press enter to finish)"
    name = $stdin.gets.chomp
    end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "------------------".center(75)
end

def print(students)
  students.each_with_index do |student, i|
      puts "#{i + 1}. #{student[:name]} is from #{student[:country]} and is #{student[:height]} tall. Hobbies include #{student[:hobbies]} (#{student[:cohort].capitalize} cohort)".center(75)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
