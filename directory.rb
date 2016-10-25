def input_students
  puts "Please enter the name of the students: \n"
  puts "To finish just hit return twice"
  students = []
  name = gets.chomp
  # puts "How about the hobby of this person? (Type one) \n"
  # hobby = gets.chomp
  # puts "And would you mind telling me where this person was born? (city) \n"
  # born = gets.chomp
  # puts "Just a few more things, anthropometric data, height? (cm) \n"
  # height = gets.chomp
  # puts "Mind letting me know how much you weigh in kgs? \n"
  # weight = gets.chomp
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # puts "Please enter the next student's name: \n"
    # name = gets.chomp
    # puts "How about the hobby of this person? (Type one) \n"
    # hobby = gets.chomp
    # puts "And would you mind telling me where this person was born? (city) \n"
    # born = gets.chomp
    # puts "Just a few more things, anthropometric data, height? (cm) \n"
    # height = gets.chomp
    # puts "Mind letting me know how much you weigh in kgs? \n"
    # weight = gets.chomp
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
    # puts "Some more details: #{student[:hobby]} as a hobby"
    # puts "This student was born in #{student[:born].capitalize}"
    # puts "The student is #{student[:height]} cm tall and #{student[:weight]} kgs light."
  end
end

# def printing_different(students)
#   index = 0
#   while !students.empty? do
#     puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort.)"
#     puts "Some more details: #{students[index][:hobby]} as a hobby"
#     puts "This student was born in #{students[index][:born]}"
#     puts "The student is #{students[index][:height]} cm tall and #{students[index][:weight]} kgs light."
#     index += 1
#     break if (index == students.length)
#   end
# end


# def starts_with_letter(students)
#   puts "What letter are you lookign for?"
#   letter = gets.chomp.upcase
#   new_list = []
#   students.each_with_index do |student, index|
#     if(student[:name].start_with?(letter))
#       new_list << {name: student[:name], cohort: :november}
#     end
#   end
#   new_list.each_with_index do |student, index|
#     puts "Name of students that starts with the letter: #{letter}"
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]})"
#   end
# end
#
#
# def name_length(students)
#   puts "I will print now all those students who's name is shorter than 12 letters:"
#   name_length = 12
#   students.each_with_index do |student, index|
#     if(student[:name].length < name_length)
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end




def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(50)
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
#printing_different(students)
space
print_footer(students)
space
#starts_with_letter(students)
#name_length(students)
