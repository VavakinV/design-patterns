require "./Person.rb"

class Student < Person
	# Конструктор класса
	def initialize(surname:, firstname:, lastname:, id:nil, git:nil, email:nil, telegram:nil, phone_number:nil)
		self.surname = surname
		self.firstname = firstname
		self.lastname = lastname
		self.id = id
		self.git = git
		set_contacts(email:email, telegram:telegram, phone_number:phone_number)
	end

	# Геттеры для полей
	attr_reader :surname, :firstname, :lastname, :phone_number, :telegram, :email

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

	# Сеттер для ID
	def id=(val)
		if self.class.valid_id?(val)
			@id = val 
		else
			raise ArgumentError, "Некорректный ID"
		end
	end

	# Сеттер контактов
	# Проверяется валидность переданных данных.
	# Если они корректны, то соответствующему полю присваивается значение.
	# Иначе выводится сообщение о некорректном вводе.
	def set_contacts(**contacts)
		self.class.valid_email?(contacts[:email]) ? (@email = contacts[:email]) : (raise ArgumentError, "Некорректный e-mail")
		self.class.valid_telegram?(contacts[:telegram]) ? (@telegram = contacts[:telegram]) : (raise ArgumentError, "Некорректный Telegram")
		self.class.valid_phone_number?(contacts[:phone_number]) ? (@phone_number = contacts[:phone_number]) : (raise ArgumentError, "Некорректный номер телефона")
	end

	# Сеттер для Git
	def git=(val)
		if self.class.valid_git?(val)
			@git = val 
		else
			raise ArgumentError, "Некорректный git"
		end
	end

	# Переопределение to_s
	# Содержит ФИО и необязательные поля при их наличии
	def to_s
		"------------------\n"+\
		"Студент: #{@surname} #{@firstname} #{@lastname}"+\
		(@id ? "\nID: #{@id}" : "")+\
		(@phone_number ? "\nНомер телефона: #{@phone_number}" : "")+\
		(@telegram ? "\nTelegram: #{@telegram}" : "")+\
		(@email ? "\ne-mail: #{@email}" : "")+\
		(@git ? "\nGit: #{@git}" : "")+\
		"\n------------------"
	end
	
	# Проверка наличия хотя бы одного из контактов
	def has_contacts?
		!@phone_number.nil? || !@telegram.nil? || !@email.nil?
	end

	# Получение фамилию и инициалов
	def initials
		"#{surname} #{firstname[0]}.#{lastname[0]}."
	end

	# Получение гита
	def git_info
		git ? "#{git}" : "Git отсутствует"
	end

	# Получение доступного средства связи
	def contact_info
		if phone_number
		  "[phone_number] #{phone_number}"
		elsif telegram
		  "[telegram] #{telegram}"
		elsif email
		  "[email] #{email}"
		else
		  "Контакты отсутствуют"
		end
	end

	# Вывод краткой информации о студенте в одной строке
	def get_info
		"#{initials}; Git: #{git_info}; Связь: #{contact_info}"
	end
end