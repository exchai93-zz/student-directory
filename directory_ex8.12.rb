# What happens if the user doesn't enter any students?
# It will try to print an empty list
# How can you use an if statement (💊 Control Flow) to only print the list if there is at least one student in there?

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
  students << {:name => name, :cohort => :november}
  puts "Now we have #{students.count} students"
  name = gets.chomp
  end

  students
end


def print_header(students)
  students_exist = students.each do |student| return student[:name]
    if students_exist >= 1
        puts "The students of Villains Academy"
        puts "------------------".
    else
end
end
end


def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end



students = input_students
print_header(students)
print(students)
print_footer(students)
