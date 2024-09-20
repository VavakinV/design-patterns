require "./Student.rb"

ivan = Student.new("Иванов", "Иван", "Иванович", id: 1, phone_number: "88005553535", git: "https://github.com/ivan")
nikita = Student.new("Козлов", "Никита", "Борисович", id: 2, phone_number: "89181112233", telegram: "@Sebas", git: "sebasxc")
masha = Student.new("Ульянова", "Мария", "Сергеевна", id: 3, phone_number: "89889998877", telegram: "t.me/Flower")
sergey = Student.new("Стрельцов", "Сергей", "Владимирович", phone_number: "89182297016")

ivan.print_info
nikita.print_info
masha.print_info
sergey.print_info

puts "get_info для ivan: #{ivan.get_info}"