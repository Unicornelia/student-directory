require "csv"

def space
  puts ""
end

@students = []
@name = nil
@cohort = nil
@filename = "students.csv"


def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end

def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  space
  get_name
  puts "What cohort does this student belong to?"
  get_cohort
  #checks the condition whether the month is filled in or typed correctly
  while !@name.empty? && !@cohort.empty? do
    #add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the next student: "
    get_name
    puts "What cohort do they belong to? "
    get_cohort
  end
  @students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------------------".center(50)
  space
end

def get_name
  @name = STDIN.gets.chomp
end

def get_cohort
  @cohort = STDIN.gets.chomp
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

def show_students
  print_header
  print_students_list
  print_footer
end

def print_menu
  puts "Please choose what you wish to do: "
  space
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit" #there will be more items
end

def load_file
  puts "What file would you like to load? (filename.extention)"
  @filename = STDIN.gets.chomp.downcase
end

def save_file
  puts "Where would you like to save your list? (filename.extention)"
  @filename = STDIN.gets.chomp.downcase
end


def process(selection)
  case selection
  when "1"
    puts "Entering students' data.."
    input_students
  when "2"
    puts "Showing students..."
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
  save_file
  CSV.open(@filename, "w") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
end

def load_students
  load_file
  CSV.open(@filename, "r") do |csv|
    csv.readlines.each do |line|
      @name, @cohort = line
      add_students
    end
  end
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isnt given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it does not exists
    load_students(filename = "students.csv")
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

#load_students #just load with this on start
interactive_menu
