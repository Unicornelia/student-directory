def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  students = []
  name = gets.chomp
  puts "What cohort does this student belong to?"
  cohort = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student: "
    name = gets.chomp
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

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
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
