require "./Person.rb"

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
		if val.nil?
			@contacts = nil
		elsif val[:phone_number]
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
		# Если их нет, выбрасывается исключение
		if parts[0].nil?
			raise ArgumentError, "Отсутствуют инициалы"
		end
		@initials = parts[0]

		# Гит находится во второй части (если его нет, то "Git отсутствует")
		self.git = parts[1].nil? ? nil : parts[1].start_with?("Git") ? parts[1].split(': ').last : nil

		# Контактная информация в третьей части (формат "Связь: [<тип>] <данные>")
		if parts[2].nil?
			self.contacts = nil
		elsif parts[2].start_with?("Связь:")
			contact_type = parts[2].match(/\[(.*?)\]/)[1]   # Извлекаем тип контакта, например, phone_number, telegram, email
			contact_data = parts[2].split('] ')[1]          # Извлекаем данные контакта

			# Преобразуем тип контакта в хэш и передаем в сеттер
			self.contacts = {contact_type.to_sym => contact_data}
		else
			raise ArgumentError, "Неверный формат контактов"
		end
	end

	# Проверка наличия хотя бы одного из контактов
	def has_contacts?
		!@contacts.nil?
	end
end