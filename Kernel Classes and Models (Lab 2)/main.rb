require "./Student.rb"

ivan = Student.new(surname:"Иванов", firstname:"Иван", lastname:"Иванович", id: 1, phone_number: "88005553535", git: "https://github.com/ivan")
nikita = Student.new(surname:"Козлов", firstname:"Никита", lastname:"Борисович", id: 2, phone_number: "89181112233", telegram: "@Sebas", git: "sebasxc")
masha = Student.new(surname:"Ульянова", firstname:"Мария", lastname:"Сергеевна", id: 3, phone_number: "89889998877", telegram: "t.me/Flower")
sergey = Student.new(surname:"Стрельцов", firstname:"Сергей", lastname:"Владимирович", phone_number: "89182297016")

puts ivan
puts nikita
puts masha
puts sergey

puts "get_info для ivan: #{ivan.get_info}"

sereja = Student_short.new(student: sergey)

puts "\nStudent_short 1:"
puts sereja.initials
puts sereja.contacts

maxim = Student_short.new(id: 10, contacts: "Серый М.А.; Git: https://github.com/max; Связь: [phone_number] +79182253564")

puts "\nStudent_short 2:"
puts maxim.initials
puts maxim.git
puts maxim.contacts