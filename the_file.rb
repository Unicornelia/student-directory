#Short program aiming to read its own source code
#and it even prints it out

def menu
  puts ""
  puts "What would you like to see about this file?"
  puts "-" * 45
  puts "1. its full name?"
  puts "2. its path?"
  puts "3. its basename?"
  puts "4. its extended path?"
  puts "5. I don't care about this file, show me a cat instead!"
  number = STDIN.gets.chomp
  case(number)
  when "1"
    space_and_lines
    current_file_name
    space_and_lines
  when "2"
    space_and_lines
    file_path
    puts "The '.' usually refers to the current library you are located in."
    space_and_lines
  when "3"
    space_and_lines
    file_base_name
    space_and_lines
  when "4"
    space_and_lines
    extended_path
    space_and_lines
  when "5"
    puts " /\\_/\\"
    puts "( o.o )"
    puts " > ^ <"
  else
    space_and_lines
    puts "No such option, Goodbye!"
    space_and_lines
  end
end

  def current_file_name
    puts "The current file's full name is: "
    puts  __FILE__
  end

  def file_path
    puts "The file can be found here: "
    puts File.dirname(__FILE__)
  end

  def file_base_name
    puts "The file's basename is: "
    puts File.basename(__FILE__)
  end

  def extended_path
    puts "The file's extended path is: "
    puts File.expand_path(__FILE__)
  end

def space_and_lines
  puts "-" * 10
  puts ""
  puts "-" * 10
end


menu
