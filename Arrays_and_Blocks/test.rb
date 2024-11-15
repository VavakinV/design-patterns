require "./array_proc.rb"
require "./unit_test.rb"

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_proc = ArrayProc.new(array)

puts "Исходный массив: #{array}"

puts "(count) Количество чётных чисел:"
puts unit_test(expected: array.count{|x| x % 2 == 0}, test_element:array) {array_proc.count{|x| x % 2 == 0}}

puts "(count) Количество чисел, квадрат которых меньше 50:"
puts unit_test(expected: array.count{|x| x**2 < 50}, test_element:array) {array_proc.count{|x| x**2 < 50}}

puts "(group_by) Группировка по остатку от деления на 4:"
puts unit_test(expected: array.group_by{|x| x % 4}, test_element:array) {array_proc.group_by{|x| x % 4}}

puts "(partition) Разделение на чётные/нечётные:"
puts unit_test(expected: array.partition{|x| x % 2 == 0}, test_element:array) {array_proc.partition{|x| x % 2 == 0}}

puts "(take_while) Элементы меньше 7: #{array_proc.take_while{|x| x < 7}}"
puts unit_test(expected: array.take_while{|x| x < 7}, test_element: array) {array_proc.take_while{|x| x < 7}}

puts "(min) Минимальный элемент:"
puts unit_test(expected: array.min, test_element:array) {array_proc.min}

puts "(min) Максимальный элемент:"
puts unit_test(expected: array.min{|x, y| -x <=> -y}, test_element:array) {array_proc.min{|x, y| -x <=> -y}}

puts "(filter_map) Удвоенные нечётные элементы:"
puts unit_test(expected: array.filter_map{|x| x*2 if x.odd?}, test_element:array) {array_proc.filter_map{|x| x*2 if x.odd?}}