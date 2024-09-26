class Person
	attr_reader :id, :git

	protected

	# Метод валидации номера телефона
	def self.valid_phone_number?(str)
		str.nil? || str.match?(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/)
	end

	# Метод валидации ФИО
	def self.valid_name?(str)
		str.match?(/^[A-ZА-Я][a-zA-Zа-яА-Я\-]{0,49}$/)
	end

	# Метод валидации ID
	def self.valid_id?(str)
		str.nil? || str.class == Integer
	end

	# Метод валидации Telegram
	def self.valid_telegram?(str)
		str.nil? || str.match?(/^(?:@|(?:(?:(?:https?:\/\/)?t(?:elegram)?)\.me\/))(\w{4,})$/)
	end

	# Метод валидации email
	def self.valid_email?(str)
		str.nil? || str.match?(/^[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+$/)
	end

	# Метод валидации Git
	def self.valid_git?(str)
		str.nil? || str.match?(/^(?:https:\/\/github\.com\/)?[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/)
	end
end

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

	# Проверка наличия гита и контактов
	def validate
		has_git? && has_contacts?
	end	

	# Проверка наличия гита
	def has_git?
		!@git.nil?
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

class Student_short < Person
	attr_reader :initials, :contacts

	# Конструктор принимает хэш с либо полем student:, либо двумя полями id: и contacts:
	def initialize(student:nil, id:nil, contacts:nil)
		if student
			# Если передан объект класса Student
			student = student
			@id = student.id
			@initials = student.initials
			@git = student.git
			@contacts = student.contact_info
		elsif id && contacts
			# Если передан id и строка contacts
			@id = id
			parse_info(contacts)
		else
			raise ArgumentError, "Неверные параметры конструктора"
		end
	end

	private

	# Сеттер для Git
	def git=(val)
		if self.class.valid_git?(val)
			@git = val 
		else
			raise ArgumentError, "Некорректный git"
		end
	end

	def contacts=(val)
		if val[:phone_number]
			if self.class.valid_phone_number?(val[:phone_number])
				@contacts = "[phone_number] #{val[:phone_number]}"
			else
				raise ArgumentError, "Некорректный номер телефона"
			end
		elsif val[:telegram]
			if self.class.valid_phone_telegram?(val[:telegram])
				@contacts = "[telegram] #{val[:telegram]}"
			else
				raise ArgumentError, "Некорректный Telegram"
			end
		elsif val[:email]
			if self.class.valid_phone_email?(val[:email])
				@contacts = "[email] #{val[:email]}"
			else
				raise ArgumentError, "Некорректный email"
			end
		else
			raise ArgumentError, "Некорректные данные связи: #{val}"
		end
	end

	# Метод для парсинга строки, содержащей инициалы, гит и контакты
	def parse_info(info_str)
		# Разбиваем строку на части
		parts = info_str.split(';').map(&:strip)

		# Инициалы находятся в первой части
		@initials = parts[0]

		# Гит находится во второй части (если его нет, то "Git отсутствует")
		self.git = parts[1].start_with?("Git") ? parts[1].split(': ').last : nil

		# Контактная информация в третьей части (формат "Связь: [<тип>] <данные>")
		if parts[2].start_with?("Связь:")
			contact_type = parts[2].match(/\[(.*?)\]/)[1]   # Извлекаем тип контакта, например, phone_number, telegram, email
			contact_data = parts[2].split('] ')[1]          # Извлекаем данные контакта

			# Преобразуем тип контакта в хэш и передаем в сеттер
			self.contacts = {contact_type.to_sym => contact_data}
		else
			raise ArgumentError, "Неверный формат контактов"
		end
	end
end
