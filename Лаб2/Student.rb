class Student
	# Конструктор класса
	def initialize(surname, firstname, lastname, **params)
		self.surname = surname
		self.firstname = firstname
		self.lastname = lastname
		self.id = params[:id]
		self.phone_number = params[:phone_number]
		self.telegram = params[:telegram]
		self.email = params[:email]
		self.git = params[:git]
	end

	# Геттеры для полей
	attr_reader :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git

	# Сеттер для фамилии
	def surname=(val)
		if self.class.valid_name?(val)
			@surname = val
		else
			raise ArgumentError, "Некорректная фамилия"
		end
	end

	# Сеттер для имени
	def firstname=(val)
		if self.class.valid_name?(val)
			@firstname = val
		else
			raise ArgumentError, "Некорректное имя"
		end
	end

	# Сеттер для отчества
	def lastname=(val)
		if self.class.valid_name?(val)
			@lastname = val
		else
			raise ArgumentError, "Некорректное отчество"
		end
	end

	# Сеттер для номера телефона
	def phone_number=(val)
		if self.class.valid_phone_num?(val)
			@phone_number = val
		else 
			puts "#{surname} #{firstname} #{lastname}: Некорректный номер телефона"
		end
	end

	# Сеттер для ID
	def id=(val)
		if self.class.valid_id?(val)
			@id = val 
		else
			puts "#{surname} #{firstname} #{lastname}: Некорректный ID"
		end
	end

	# Сеттер для Telegram
	def telegram=(val)
		if self.class.valid_telegram?(val)
			@telegram = val 
		else
			puts "#{surname} #{firstname} #{lastname}: Некорректный telegram"
		end
	end

	# Сеттер для email
	def email=(val)
		if self.class.valid_email?(val)
			@email = val 
		else
			puts "#{surname} #{firstname} #{lastname}: Некорректный email"
		end
	end

	# Сеттер для Git
	def git=(val)
		if self.class.valid_git?(val)
			@git = val 
		else
			puts "#{surname} #{firstname} #{lastname}: Некорректный git"
		end
	end

	# Метод валидации номера телефона
	def self.valid_phone_num?(str)
		str.nil? || str.match?(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/)
	end

	# Метод валидации ФИО
	def self.valid_name?(str)
		str.match?(/^[A-ZА-Я][a-zA-Zа-яА-Я\-]{0,49}$/)
	end

	# Метод валидации ID
	def self.valid_id?(str)
		str.nil? || str.class == Integer ? true : str.match?(/^(\d+)$/) ? true : false
	end

	# Метод валидации Telegram
	def self.valid_telegram?(str)
		str.nil? || str.match?(/^(?:@|(?:(?:(?:https?:\/\/)?t(?:elegram)?)\.me\/))(\w{4,})$/)
	end

	# Метод валидации email
	def self.valid_email?(str)
		str.nil? || str.match?(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/)
	end

	# Метод валидации Git
	def self.valid_git?(str)
		str.nil? || str.match?(/^(?:https:\/\/github\.com\/)?[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/)
	end

	# Вывод информации о студенте
	def print_info
		puts "------------------\n" + "Студент: #{@surname} #{@firstname} #{@lastname}" + (@id ? "\nID: #{@id}" : "") + (@phone_number ? "\nНомер телефона: #{@phone_number}" : "") + (@telegram ? "\nTelegram: #{@telegram}" : "") + (@email ? "\ne-mail: #{@email}" : "") + (@git ? "\nGit: #{@git}" : "") + "\n------------------"
	end
end
