# Проверка, является ли элемент по указанному индексу
# глобальным максимумом массива
def global_max?(array, index)
	return false if index < 0 || index >= array.size # Возврат false, если индекс за пределами массива

	element = array[index]

	array.all?{|e| element >= e} # Проверка, что все элементы массива <= выбранного
end

# Проверка, является ли элемент по указанному индексу
# локальным минимумом (<= своих соседей)
def local_min?(array, index)
	return false if index < 0 || index >= array.size # Возврат false, если индекс за пределами массива
  
	element = array[index]

	# Проверка соседних элементов
	is_left_min = index == 0 || element < array[index - 1]
	is_right_min = index == array.size - 1 || element < array[index + 1]

	is_left_min && is_right_min
end


# Ввод номера метода с клавиатуры
puts "Выберите метод:\n1 - Проверка на глобальный максимум\n2 - Проверка на локальный минимум"
print "Введите номер: "
method_num = gets.chomp.to_i

# Выбор метода
case method_num
when 1
	puts "Введите элементы массива, разделенные пробелами:"
	input = gets.chomp
	array = input.split.map{|x| x.to_i}
	puts "Введите индекс элемента для проверки (от 0 до #{array.size - 1}):"
	i = gets.chomp.to_i
	if global_max?(array, i)
  		puts "Элемент по индексу #{i} является глобальным максимумом."
	else
  		puts "Элемент по индексу #{i} не является глобальным максимумом."
	end
when 2
	puts "Введите элементы массива, разделенные пробелами:"
	input = gets.chomp
	array = input.split.map{|x| x.to_i}
	puts "Введите индекс элемента для проверки (от 0 до #{array.size - 1}):"
	i = gets.chomp.to_i
	if local_min?(array, i)
  		puts "Элемент по индексу #{i} является локальным минимумом."
	else
  		puts "Элемент по индексу #{i} не является локальным минимумом."
	end
end