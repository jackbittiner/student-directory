def input_students
  puts "Please enter the names of the students"
  puts "To finish, just enter everything blank then press enter"
  students = []
  name = gets.chomp
  puts "Their nationality?"
  nationality = gets.chomp
  puts "And the course they are studying?"
  course = gets.chomp
  while !name.empty? && !nationality.empty? && !course.empty? do
    students << {name: name, cohort: :november, nationality: nationality, course: course}
    puts "Now we have #{students.count} students"
    puts "Next student name:"
    name = gets.chomp
    puts "Nationality?"
    nationality = gets.chomp
    puts "And course:"
    course = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]}, #{student[:nationality]}, #{student[:course]} (#{student[:cohort]} cohort)"
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
