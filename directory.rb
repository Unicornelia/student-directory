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
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name].capitalize} (#{student[:cohort].capitalize} cohort)".center(20)
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
  if names.count <= 1
    puts "Overall, we have #{names.count} great student".center(50)
  else
    puts "Overall, we have #{names.count} great students".center(50)
  end
end

def space
  puts ""
end


space
students = input_students
print_header
space
printing(students)
space
print_footer(students)
space
sort_by_cohort(students)
