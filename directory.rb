#first we put all students in an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone",cohort: :november},
  {name: "Alex DeLarge",cohort: :november},
  {name: "The Wicked Witch of the West",cohort: :november},
  {name: "Terminator",cohort: :november},
  {name: "Freddy Krueger",cohort: :november},
  {name: "The Joker",cohort: :november},
  {name: "Joffrey Baratheon",cohort: :november},
  {name: "Norman Bates",cohort: :november}
]


def print_header
  puts "The students of Villains Academy"
  puts "-" * 35
end

def printing(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
print_header
space
printing(students)
space
print_footer(students)
space
