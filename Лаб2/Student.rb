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

	attr_reader :surname
	attr_writer :surname

	attr_reader :firstname
	attr_writer :firstname

	attr_reader :lastname
	attr_writer :lastname

	attr_reader :id
	attr_writer :id

	attr_reader :phone_number
	attr_writer :phone_number

	attr_reader :telegram
	attr_writer :telegram

	attr_reader :email
	attr_writer :email

	attr_reader :git
	attr_writer :git


	# Вывод информации о студенте
	def print_info
		puts "------------------\n" + "Студент: #{@surname} #{@firstname} #{@lastname}" + (@id ? "\nID: #{@id}" : "") + (@phone_number ? "\nНомер телефона: #{@phone_number}" : "") + (@telegram ? "\nTelegram: #{@telegram}" : "") + (@email ? "\ne-mail: #{@email}" : "") + (@git ? "\nGit: #{@git}" : "") + "\n------------------"
	end
end