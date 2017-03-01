# We've been using the chomp() method to get rid of the last return character.
# Find another method among those provided by the String class that could be used for the same purpose
# (although it will require passing some arguments)
# chomp() method takes away the \n

# strip is another method

#  $stdiin = ARGV

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = $stdin.gets.strip
  # while the name is not empty, repeat this code
  while !name.empty? do
    # get user input about more information?
    puts "Now enter the cohort of this student: "
    # convert input from string to a symbol
    cohort = $stdin.gets.strip.downcase.to_sym
    # inputs to be expected
    cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    # if input is empty give a default value
    if cohort.empty?
      cohort = :november
    # if cohort does not include any of the values listed in cohorts, try again until it does
    elsif !cohorts.include? cohort
        until cohorts.include? cohort
          puts "Invalid cohort. Try again."
          cohort = $stdin.gets.strip.downcase.to_sym
        end
    end

    students << {name: name, cohort: cohort}
      number_students = students.count
        if number_students == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} great students"
        end

    # get another name from the user
    puts "Now enter another student's name (or press enter to finish)"
    name = $stdin.gets.strip
    end
    # return the array of students
    students
    end

    def print_header
    puts "The students of Villains Academy".center(75)
    puts "------------------".center(75)
    end

    # print grouped by cohorts
    # get list of all existing cohorts
    # iterate over it and only print the students from that cohort
    def print(students)
      # get the cohorts for all the students and store into variable 'cohorts'
      cohorts = students.map do |student|
        student[:cohort]
    end

      cohorts.uniq.each do |x|  # delete all the duplicates of the cohorts
        puts "#{x} cohort" # print the cohorts
        students.each do |student| # iterate through the students array, and if the student exists to that cohort, put their name
          if student[:cohort] == x # find cohort and match students to cohort
          puts student[:name]
          end
        end
      end
    end

    def print_footer(names)
        # create a new hash
        number_names = names.count
        if number_names == 1
          puts "Overall we have 1 great student"
        elsif
          number_names == 0
          puts "There are no students."
        else
          puts "Overall, we have #{names.count} great students"
    end
  end


    students = input_students
    # nothing happens until we call the methods
    print_header
    print(students)
    print_footer(students)
