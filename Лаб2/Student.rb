class Student
	# Конструктор класса
	def initialize(surname, firstname, lastname, **params)
		@surname = surname
		@firstname = firstname
		@lastname = lastname
		@id = params[:id]
		self.phone_number = params[:phone_number]
		@telegram = params[:telegram]
		@email = params[:email]
		@git = params[:git]
	end

	# Геттеры и сеттеры полей

	attr_accessor :surname, :firstname, :lastname, :id, :telegram, :email, :git

	# Геттер для номера телефона
	attr_reader :phone_number

	# Сеттер для номера телефона
	def phone_number=(val)
		if self.class.valid_phone_num?(val)
			@phone_number = val
		else 
			puts "#{surname} #{firstname} #{lastname}: Некорректный номер телефона"
		end
	end

	# Вывод информации о студенте
	def print_info
		puts "------------------\n" + "Студент: #{@surname} #{@firstname} #{@lastname}" + (@id ? "\nID: #{@id}" : "") + (@phone_number ? "\nНомер телефона: #{@phone_number}" : "") + (@telegram ? "\nTelegram: #{@telegram}" : "") + (@email ? "\ne-mail: #{@email}" : "") + (@git ? "\nGit: #{@git}" : "") + "\n------------------"
	end

	# Метод валидации номера телефона
	def self.valid_phone_num?(str)
		str.nil? || str.match?(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/)
	end
end
