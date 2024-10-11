require "./ArrayProc.rb"

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_proc = ArrayProc.new(array)

puts "Исходный массив: #{array}"
puts "(count) Количество чётных чисел: #{array_proc.count{|x| x % 2 == 0}}"
puts "(count) Количество чисел, квадрат которых меньше 50: #{array_proc.count{|x| x**2 < 50}}"
