def line
  puts "-" * 35
end

def space
  puts ""
end

#first we print the list of students
space
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
#and then print them
puts "The students of Villains Academy"
line
space

students.each do |student|
  puts student
end

line
space
#Finally we print the total number of students
puts "Overall, we have #{students.count} great students"
line
space
