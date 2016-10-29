def space
  puts ""
end

@students = []

def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  space
  name = STDIN.gets.chomp
  puts "What cohort does this student belong to?"
  cohort = STDIN.gets.chomp
  #checks the condition whether the month is filled in or typed correctly
  if cohort.empty?
    cohort = "not know which"
  elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
    cohort = cohort
  else
    puts "You made a typo in the name of the cohort, make sure you type it with a capital letter."
    cohort = STDIN.gets.chomp
  end

  while !name.empty? && !cohort.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the next student: "
    name = STDIN.gets.chomp
    puts "What cohort do they belong to? "
    cohort = STDIN.gets.chomp
    if cohort.empty?
      cohort = "not know which"
    elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
      cohort = cohort
    else
      puts "You made a typo in the name of the cohort, make sure you type it with a capital letter."
      cohort = STDIN.gets.chomp
    end
  end
  @students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------------------".center(50)
  space
end

def print_students_list
  if @students.length > 0
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(20)
    end
  else
    puts "No students no list!"
  end
end

def print_footer
  if @students.count == 1
    space
    puts "Overall, we have #{@students.count} great student".center(50)
    space
  elsif @students.count == 0
    puts "No students present, as I said, no list for you!"
    puts "Next time try to actually add something to the list. :) "
    space
  else
    puts "Overall, we have #{@students.count} great students".center(50)
    space
  end
end

def print_menu
  puts "Please choose what you wish to do: "
  space
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to student.csv"
  puts "4. Load the list from student.csv"
  puts "9. Exit" #there will be more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Saving students..."
    puts "Done, you can exit if you wish"
    save_students
  when "4"
    puts "Loading students' list from file.."
    load_students
    puts "You still need to ask the program to show you the students"
  when "9"
    puts "Goodbye!"
    exit #this will terminate our program
  else
    puts "I don't know what you meant, try again!"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isnt given
  if File.exists?(filename) #if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else #if it does not exists
      puts "Sorry, #{filename} doesn't exist."
      exit #quit the program
    end
end

try_load_students
interactive_menu
