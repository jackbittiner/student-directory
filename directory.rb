def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."
  end
end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "And which cohort are they on?"
  cohort = gets.chomp
  cohort.empty? ? cohort = :november : cohort = cohort.downcase.to_sym
  while !name.empty? && !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} #{plural(students)}"
    puts "Next student's name:"
    name = gets.chomp
    puts "and their cohort?"
    cohort = gets.chomp
    cohort.empty? ? cohort = :november : cohort = cohort.to_sym
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]}, (#{student[:cohort]} cohort)"
end
end

def plural(students)
  students.count == 1 ? "student" : "students"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{plural(students)}."
end

interactive_menu
