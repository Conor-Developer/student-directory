@students = [] # an empty array accessible to all methods

def manually_load_students_on_startup(return_or_exit = false)
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students # Load students.csv automatically
    return
  end

  check_load_file_exists(filename, return_or_exit)
end

def explicit_save_file(filename)
  if File.exist?(filename) # if it exists
    save_students(filename)
  else # if it doesn't exist
    puts "\nSorry, #{filename} doesn't exist.\n\n"
  end
end

def check_load_file_exists(filename, return_or_exit)
  if File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
      if return_or_exit == true
        return
      else
        exit # quit the program
      end
  end
end

def push_hash_to_student_array(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def choose_file(load_or_save)
  puts "Which file would you like to #{load_or_save}?"
  filename = STDIN.gets.chomp
  
  if filename == ""
    return nil
  else
    filename
  end
end

def load_students(filename = "students.csv")
  @students = []
  list = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      push_hash_to_student_array(name, cohort)
    end
  end
  puts "\nThe student list file has been loaded.\n\n"
end

def interactive_menu
  loop do
    print_menu
    user_choose_option(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def user_choose_option(selection)
  case selection
  when "1"
    input_students
    puts "The list has been updated.\n\n"
  when "2"
    show_students
    puts "\nPrinting list of students completed.\n\n"
  when "3"
    filename = choose_file("save")
    if filename == nil
      save_students
    else
      explicit_save_file(filename)
    end
  when "4"
    filename = choose_file("load")
    if filename == nil
      load_students
    else
      return_or_exit = true
      check_load_file_exists(filename, return_or_exit)
    end
  when "9"
    exit # this will cause the program to terminate
  else
    puts "\nI don't know what you meant, try again\n\n"
  end
end

def input_students_message
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
end

def input_students
  input_students_message
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    push_hash_to_student_array(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
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
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students(filename = "students.csv")
  # open the file for writing and iterate over the array of students
  csv = File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "\nThe student list file has been saved.\n\n"
end

manually_load_students_on_startup
interactive_menu

# file = File.open(filename, "w")