# Проверка, является ли элемент по указанному индексу
# глобальным максимумом массива
def global_max?(array, index)
	return false if index < 0 || index >= array.size # Возврат false, если индекс за пределами массива

	element = array[index]

	array.all?{|e| element >= e} # Проверка, что все элементы массива <= выбранного
end

# Ввод номера метода с клавиатуры
puts "Выберите метод:\n1 - Проверка на глобальный максимум"
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
end