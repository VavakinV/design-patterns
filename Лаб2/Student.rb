class Student
	# Конструктор класса
	def initialize(surname, firstname, lastname, **params)
		@surname = surname
		@firstname = firstname
		@lastname = lastname
		@id = params[:id]
		@phone_number = params[:phone_number]
		@telegram = params[:telegram]
		@email = params[:email]
		@git = params[:git]
	end

	# Геттеры и сеттеры полей

	attr_accessor :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git

	# Вывод информации о студенте
	def print_info
		puts "------------------\n" + "Студент: #{@surname} #{@firstname} #{@lastname}" + (@id ? "\nID: #{@id}" : "") + (@phone_number ? "\nНомер телефона: #{@phone_number}" : "") + (@telegram ? "\nTelegram: #{@telegram}" : "") + (@email ? "\ne-mail: #{@email}" : "") + (@git ? "\nGit: #{@git}" : "") + "\n------------------"
	end
end
