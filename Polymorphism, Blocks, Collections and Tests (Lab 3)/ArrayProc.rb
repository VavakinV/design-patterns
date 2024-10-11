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

	# Группировка элементов массива по ключам, возвращаемым из передаваемого блока
	def group_by
		result = {}

		# Перебор элементов массива
		@array.each do |element|
			# Значение блока для элемента является ключом
			key = yield(element)
			# Если ключ есть в хэше, добавить элемент, иначе создать новый
			result[key] ? result[key].append(element) : result[key] = [element]
		end

		result
	end
end