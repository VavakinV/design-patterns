require "./student.rb"
require "./student_short.rb"
require "./student_binary_tree.rb"
require "date"

require "./models/data_list_student_short.rb"

ivan = Student.new(surname:"Иванов", firstname:"Иван", lastname:"Иванович", id: 1, phone_number: "88005553535", git: "https://github.com/ivan", date_of_birth: Date.parse("16.06.2004"))
nikita = Student.new(surname:"Козлов", firstname:"Никита", lastname:"Борисович", id: 2, phone_number: "89181112233", telegram: "@Sebas", git: "sebasxc", date_of_birth: Date.parse("09.06.2004"))
masha = Student.new(surname:"Ульянова", firstname:"Мария", lastname:"Сергеевна", id: 3, phone_number: "89889998877", telegram: "t.me/Flower", date_of_birth: Date.parse("15.03.2005"))
sergey = Student.new(surname:"Стрельцов", firstname:"Сергей", lastname:"Владимирович", phone_number: "89182297016")

sereja = Student_short.new(student: sergey)
maxim = Student_short.new(id: 10, contacts: "Серый М.А.; Git: https://github.com/max; Связь: [phone_number] +79182253564")
oleg = Student_short.new(id: 20, contacts: "Красный О.О.;;")

# puts ivan
# puts nikita
# puts masha
# puts sergey

# puts "\nget_info для ivan: #{ivan.get_info}"

# puts "\nStudent_short 1:"
# puts sereja.initials
# puts sereja.contacts

# puts "\nStudent_short 2:"
# puts maxim.initials
# puts maxim.git
# puts maxim.contacts

# puts "\nStudent_short 3:"
# puts oleg.initials

# puts "\nvalidate для ivan: #{ivan.validate}"
# puts "\nvalidate для sereja: #{sereja.validate}"

# student_bt = Student_binary_tree.new
# student_bt.insert(ivan)
# student_bt.insert(nikita)
# student_bt.insert(masha)
# student_bt.insert(sergey)

# puts "\nУзлы двоичного дерева ivan, nikita, masha, sergey:"
# student_bt.each{|node| puts node.element}

puts("\nПроверка Data_list_student_short:")
student_short_list = Data_list_student_short.new([sereja, maxim , oleg])
table = student_short_list.get_data

(0..3).each do |index|
    puts "#{table.get_element(index, 1)}, #{table.get_element(index, 2)}, #{table.get_element(index, 3)}"   
end