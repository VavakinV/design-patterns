require "./person.rb"

class Student < Person
	include Comparable

	# Конструктор класса
	def initialize(surname:, firstname:, lastname:, id:nil, git:nil, email:nil, telegram:nil, phone_number:nil, date_of_birth:nil)
		self.surname = surname
		self.firstname = firstname
		self.lastname = lastname
		self.id = id
		self.git = git
		self.date_of_birth = date_of_birth
		set_contacts(email:email, telegram:telegram, phone_number:phone_number)
	end

	# Геттеры для полей
	attr_reader :surname, :firstname, :lastname, :phone_number, :telegram, :email, :git, :date_of_birth

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

	# Сеттер для даты рождения
	def date_of_birth=(val)
		if self.class.valid_date_of_birth?(val)
			@date_of_birth = val
		else
			raise ArgumentError, "Некорректная дата рождения"
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
		(@date_of_birth ? "\nДата рождения: #{@date_of_birth}" : "")+\
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

	# Получение доступного средства связи
	def contacts
		if phone_number
		  "[phone_number] #{phone_number}"
		elsif telegram
		  "[telegram] #{telegram}"
		elsif email
		  "[email] #{email}"
		else
		  nil
		end
	end

	# Вывод краткой информации о студенте в одной строке
	def get_info
		"#{initials}; Git: #{git}; Связь: #{contacts}"
	end

	# Переопределение <=> по дате рождения
	def <=>(other)
		return nil unless other.is_a?(Student)
		compare_dates(date_of_birth, other.date_of_birth)
	end

	private

	# Метод для сравнения двух строковых дат (значения nil считаются больше по умолчанию)
	def compare_dates(date1, date2)
		return 1 if (date1.nil? && date2.nil?) || (date1.nil?)
		return -1 if date2.nil?

		day1, month1, year1 = date1.split('.').map(&:to_i)
		day2, month2, year2 = date2.split('.').map(&:to_i)

		if year1 != year2
			year1 <=> year2
		elsif month1 != month2
			month1 <=> month2
		else
			day1 <=> day2
		end
	end
end