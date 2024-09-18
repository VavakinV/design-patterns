require "./Student.rb"

ivan = Student.new("Иванов", "Иван", "Иванович", 1, "88005553535")
nikita = Student.new("Козлов", "Никита", "Борисович", 2, "89181112233", "Sebas", nil, "https://github.com/SebaSxc")
masha = Student.new("Ульянова", "Мария", "Сергеевна", 3, "89889998877", "Flower")

ivan.print_info
nikita.print_info
masha.print_info