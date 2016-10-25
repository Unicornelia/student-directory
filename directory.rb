#no more hardcoding, lets ask for input!
def input_students
  puts "Please enter the names of the students"
#  puts "Please also let me know where this student was born"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []
  #get the first name
  name = gets.chomp

  #while the name is not empty, repeat this one

  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-" * 35
end



def starts_with_letter(students)
puts "What letter are you lookign for?"
letter = gets.chomp.upcase
  #almost good, but the function should not iterate just if the letter is right
  students.each_with_index do |student, index|
  if(student[:name].start_with?(letter))
    puts "Name of students that starts with the letter: #{letter}"
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
  else
    puts "That's all folks, no more names like this"
  end
end
end


def name_length(students)
  students.each_with_index do |student, index|
  if(student[:name].length < 12)
    puts "Name of students who's name is shorter than 12 letters"
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  else
    puts "That's all folks, no more short names like this"
  end
end
end


def printing(students)
  students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def space
  puts ""
end

#and then print them
#nothing happens till we call them methods though

space
students = input_students
print_header
space
printing(students)
space
print_footer(students)
space
starts_with_letter(students)
space
#name_length(student)
