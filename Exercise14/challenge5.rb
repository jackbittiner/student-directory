@students = []

def print_menu
  options = ["Input the students", "Show the students", "Save the list to students.csv",
  "Load the list from the students.csv", "Exit"]
  options.each_with_index do |option, index|
    puts (index + 1).to_s + ". " + option
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
    puts "#{@students.count} students were saved to students.csv"
  when "4"
    load_students
    puts "#{@students.count} students were loaded from students.csv"
  when "5"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Save to which file?"
  filename = STDIN.gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Load from which file?"
  filename = STDIN.gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename) && !filename.nil?
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


try_load_students
interactive_menu
