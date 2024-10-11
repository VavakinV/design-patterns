# Класс обработки массива
class ArrayProc
	def initialize(array)
		@array = array.dup
	end

	# Получение элемента по индексу
	def get_element(index)
		@array[index]
	end

	# Подсчёт всех элементов, удовлетворяющих условию в передаваемом блоке
	def count
		result = 0

		# Перебор элементов массива
		@array.each do |element|
			result += 1 if yield(element) # Увеличиваем счётчик, если выполняется условие блока
		end

		result
	end
end