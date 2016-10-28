def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  students = []
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
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
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
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------------------".center(50)
end

def printing(students)
  if students.length > 0
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(20)
    end
  else
    puts "No students no list!"
  end
end

def sort_by_cohort(students)
  students.sort_by do |student|
    student[:cohort]
    puts "The following students belong to the #{student[:cohort]} cohort: \n"
    puts "#{student[:name]}."
  end
end

def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student".center(50)
  elsif names.count == 0
    puts "No students present, as I said, no list for you!"
    puts "Next time try to actually add something to the list. :) "
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end

def space
  puts ""
end


def interactive_menu
  students = []
  puts "Hello there, please choose what you wish to do: "
  loop do
    #1. orint the menu and asj the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" #there will be more items
    #2. read the unput and save it into a variable
    selection =  gets.chomp
    #3. do what the user has asked
    case selection
    when "1"
      space
      students = input_students
      space
    when "2"
      space
      print_header
      printing(students)
      print_footer(students)
      space
    when "9"
      puts "Goodbye!"
      exit #this will terminate our program
    else
      puts "I don't know what you meant, try again!"
    end
  end
end

interactive_menu
