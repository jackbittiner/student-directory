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

def print_cohort(students)
  array = []
  puts "Which cohort's students would you like to see?"
  cohort_input = gets.downcase.chomp
  students.map do |student|
    if student[:cohort].downcase.to_sym == cohort_input.to_sym
       array << student
    else return nil
    end
  end
  puts array
end

def plural(students)
  students.count == 1 ? "student" : "students"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{plural(students)}."
end

students = input_students
print_header
if !students.empty?
print_cohort(students)
else puts "There aren't any!"
end
if !students.empty?
print_footer(students)
else nil
end
