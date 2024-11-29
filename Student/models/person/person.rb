require 'date'

class Person
	attr_reader :id, :git

	def contacts
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

	def intials
		raise NotImplementedError, "Метод не реализован в классе Person"
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
		raise NotImplementedError, "Метод не реализован в классе Person"
	end

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

	# Метод валидации даты рождения
	def self.valid_date_of_birth?(str)
		str.nil? || str.is_a?(Date)
	end
end

