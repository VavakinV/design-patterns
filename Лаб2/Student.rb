class Student
	# Конструктор класса
	def initialize(surname, firstname, lastname, id=nil, phone_number=nil, telegram=nil, email=nil, git=nil)
		@surname = surname
		@firstname = firstname
		@lastname = lastname
		@id = id
		@phone_number = phone_number
		@telegram = telegram
		@email = email
		@git = git
	end

	# Геттеры и сеттеры полей

	attr_accessor :surname

	attr_accessor :firstname

	attr_accessor :lastname

	attr_accessor :id

	attr_accessor :phone_number

	attr_accessor :telegram

	attr_accessor :email

	attr_accessor :git


	# Вывод информации о студенте
	def print_info
		puts "------------------\n" + "Студент: #{@surname} #{@firstname} #{@lastname}" + (@id ? "\nID: #{@id}" : "") + (@phone_number ? "\nНомер телефона: #{@phone_number}" : "") + (@telegram ? "\nTelegram: #{@telegram}" : "") + (@email ? "\ne-mail: #{@email}" : "") + (@git ? "\nGit: #{@git}" : "") + "\n------------------"
	end
end