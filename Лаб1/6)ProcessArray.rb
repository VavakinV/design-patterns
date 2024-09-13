# Подключение методов из файла 5)ArrayMethods.rb
require "./5)ArrayMethods.rb"

# Вывод сообщения об ошибке, если аргументы указаны неверно
if ARGV.size != 2
	puts "Некорректное число аргументов"
	exit
end

method_num = ARGV[0].to_i # номер метода обработки
file_path = ARGV[1] # путь к файлу с массивом

begin
  arr = File.read(file_path).split.map{|elem| elem.to_i} # Чтение файла с преобразованием строк в числа
rescue Errno::ENOENT # Обработка Error No Entry - отсутствие нужного файла
  puts "Файл не найден: #{file_path}"
  exit
end


# Выбор метода и вывод соответствующего результата
case method_num
when 1
	result = find_min(arr)
	puts "Минимальный элемент: #{result}"
when 2
	result = find_positive(arr)
	puts "Все положительные элементы: #{result}"
when 3
	result = find_first_positive_index(arr)
	puts "Номер первого положительного элемента: #{result}"
else 
	puts "Неверно указан номер метода"
end