def input_students
  puts "Please enster the name of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # p name
  #name.gsub!("\n", "")
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Which cohort are you part of?"
    cohort = gets.capitalize

    cohort.gsub!("\n", "")

    case cohort

    when "January"
      cohort = cohort.to_sym
    when "February"
      cohort = cohort.to_sym
    when "March"
      cohort = cohort.to_sym
    when "April"
      cohort = cohort.to_sym
    when "May"
      cohort = cohort.to_sym
    when "June"
      cohort = cohort.to_sym
    when "July"
      cohort = cohort.to_sym
    when "August"
      cohort = cohort.to_sym
    when "September"
      cohort = cohort.to_sym
    when "October"
      cohort = cohort.to_sym
    when "November"
      cohort = cohort.to_sym
    when "December"
      cohort = cohort.to_sym
    when ""
      cohort = :unknown
    end

    if cohort.class != Symbol
      next
    end
      
    puts "What are your hobbies?"
    hobbies = gets
    hobbies.gsub!("\n", "")
    puts "What is your country of birth?"
    cob = gets
    cob.gsub!("\n", "")
    puts "What is your height?"
    height = gets
    height.gsub!("\n", "")
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobbies: hobbies, cob: cob, height: height}

    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end

    # get another name from the user
    name = gets
    name.gsub!("\n", "")
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  counter = 0
  organised_list = {}

  students.each do |student|
    month = student[:cohort]
    if organised_list[month] == nil
      organised_list[month] = []
    end
    organised_list[month].push(student)
  end

  counter = 0
  organised_list.map do |key, array_of_h|
    array_of_h.map do |key, value|
      puts "#{counter + 1}. #{key[:name]} (#{key[:cohort]} cohort)"\
      ",\sHobbies: #{key[:hobbies]}"\
      ",\sCoB: #{key[:cob]}"\
      ",\sHeight: #{key[:height]}".center(100)
      counter += 1
    end
  end
end

# Iterating over students array using a while loop and a branch 
# (conditional and condition) for exercises 2-4 branch:

# def print(students)
#   counter = 0
#   while counter < students.length 
#     if students[counter][:name].chr == "C" && students[counter][:name].length < 12
#      puts student information (name, cohort, hobbies, CoB, height)
#       counter += 1
#     end
#   end
# end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(100)
  else 
    puts "Overall, we have #{students.count} great students".center(100)
  end
end

# nothing happens until we call the methods
student = input_students

if student.length == 0
  return
end

print_header
print(student)
print_footer(student)
