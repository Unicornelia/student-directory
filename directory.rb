def space
  puts ""
end

@students = []

def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  space
  name = gets.strip
  puts "What cohort does this student belong to?"
  cohort = gets.strip
  #checks the condition whether the month is filled in or typed correctly
  if cohort.empty?
    cohort = "not know which"
  elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
    cohort = cohort
  else
    puts "You made a typo in the name of the cohort, make sure you type it with a capital letter."
    cohort = gets.chomp
  end

  while !name.empty? && !cohort.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the next student: "
    name = gets.chomp
    puts "What cohort do they belong to? "
    cohort = gets.chomp
    if cohort.empty?
      cohort = "not know which"
    elsif cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
      cohort = cohort
    else
      puts "You made a typo in the name of the cohort, make sure you type it with a capital letter."
      cohort = gets.chomp
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

def sort_by_cohort
  @students.sort_by do |student|
    student[:cohort]
    puts "The following students belong to the #{student[:cohort]} cohort: \n"
    puts "#{student[:name]}."
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
  puts "Hello there, please choose what you wish to do: "
  space
  #1. orint the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
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
    process(gets.chomp)
  end
end



interactive_menu
