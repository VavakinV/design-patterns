class Student
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

	def surname
		@surname
	end

	def surname=(val)
		@surname = val
	end

	def firstname
		@firstname
	end

	def firstname=(val)
		@firstname = val
	end

	def lastname
		@lastname
	end

	def lastname=(val)
		@lastname = val
	end

	def id
		@id
	end

	def id=(val)
		@id = val
	end

	def phone_number
		@phone_number
	end

	def phone_number=(val)
		@phone_number = val
	end

	def telegram
		@telegram
	end

	def telegram=(val)
		@telegram = val
	end

	def email
		@email
	end

	def email=(val)
		@email = val
	end

	def git
		@git
	end

	def git=(val)
		@git = val
	end
end