require "./ArrayProc.rb"

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_proc = ArrayProc.new(array)

puts "Исходный массив: #{array}"
puts "(count) Количество чётных чисел: #{array_proc.count{|x| x % 2 == 0}}"
puts "(count) Количество чисел, квадрат которых меньше 50: #{array_proc.count{|x| x**2 < 50}}"
puts "(group_by) Группировка по остатку от деления на 4: #{array_proc.group_by{|x| x % 4}}"
puts "(partition) Разделение на чётные/нечётные: #{array_proc.partition{|x| x % 2 == 0}}"
puts "(take_while) Элементы меньше 7: #{array_proc.take_while{|x| x < 7}}"
