require "./array_proc.rb"

def unit_test(expected:, test_element:)
	begin
		result = yield(test_element)
	rescue Error
		result = "error"
	end
	puts "Результат: #{result == "error" ? "ЗАВЕРШЕНО С ОШИБКОЙ" : expected == result ? "ПРОЙДЕН" : "НЕ ПРОЙДЕН" }, Ожидается: #{expected}, Получено: #{result}"
end

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_proc = ArrayProc.new(array)

puts "Исходный массив: #{array}"
puts "(count) Количество чётных чисел:"
unit_test(expected:5, test_element:array) {array_proc.count{|x| x % 2 == 0}}
puts "(count) Количество чисел, квадрат которых меньше 50:"
unit_test(expected:7, test_element:array) {array_proc.count{|x| x**2 < 50}}
puts "(group_by) Группировка по остатку от деления на 4:"
unit_test(expected:{1=>[1, 5, 9], 2=>[2, 6, 10], 3=>[3, 7], 0=>[4, 8]}, test_element:array) {array_proc.group_by{|x| x % 4}}
puts "(partition) Разделение на чётные/нечётные:"
unit_test(expected:[[2, 4, 6, 8, 10],[1, 3, 5, 7, 9]], test_element:array) {array_proc.partition{|x| x % 2 == 0}}
puts "(take_while) Элементы меньше 7: #{array_proc.take_while{|x| x < 7}}"
unit_test(expected: [1, 2, 3, 4, 5, 6], test_element: array) {array_proc.take_while{|x| x < 7}}
puts "(min) Минимальный элемент:"
unit_test(expected: 1, test_element:array) {array_proc.min}
puts "(min) Максимальный элемент:"
unit_test(expected: 10, test_element:array) {array_proc.min{|x, y| -x <=> -y}}
puts "(filter_map) Удвоенные нечётные элементы:"
unit_test(expected: [2, 6, 10, 14, 18], test_element:array) {array_proc.filter_map{|x| x*2 if x.odd?}}