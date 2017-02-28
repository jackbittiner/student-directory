def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "And which cohort are they on?"
  cohort = gets.chomp
  cohort.empty? ? cohort = :november : cohort = cohort.to_sym
  while !name.empty? && !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
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
  students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
