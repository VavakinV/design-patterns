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

	# Разделение массива на два по выполнению условия в блоке
	def partition
		true_list = []
		false_list = []

		# Перебор элементов массива
		@array.each do |element|
			yield(element) ? true_list.append(element) : false_list.append(element)
		end

		return [true_list, false_list]
	end

	# Получение элементов, пока блок возвращает true
	def take_while
		result = []

		# Перебор элементов массива
		@array.each do |element|
			break unless yield(element) # Выход из цикла, если условие блока не выполняется
			result << element # Иначе к результату добавляется текущий элемент
		end

		result
	end
end