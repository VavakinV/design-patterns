class Tree_node
	attr_accessor :student, :left, :right

	def initialize(student)
		@student = student
		@left = nil
		@right = nil
	end
end