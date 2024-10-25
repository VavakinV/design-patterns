require "./student_binary_tree_node.rb"
require "./student.rb"

class Student_binary_tree
	include Enumerable

	attr_reader :root

	def initialize
		@root = nil
	end

	# Добавление нового студента к дереву
	def insert(student)
		unless student.is_a?(Student)
			raise ArgumentError, "Добавляемый узел не является Student"
		end

		if @root.nil?
			@root = Tree_node.new(student)
		else
			insert_node(@root, student)
		end
	end

	# Переопределение each для Enumerable
	def each(&block)
		dfs(@root, &block)
	end

	private

	# Рекурсивный обход в глубину
	def dfs(node, &block)
		return if node.nil?

		dfs(node.left, &block)
		yield node
		dfs(node.right, &block)
	end

	# Добавление нового студента к указанному узлу
	def insert_node(node, student)
		if student < node.student
			if node.left.nil?
				node.left = Tree_node.new(student)
			else
				insert_node(node.left, student)
			end
		else
			if node.right.nil?
				node.right = Tree_node.new(student)
			else
				insert_node(node.right, student)
			end
		end
	end
end