# Проверка числа на простоту
def is_prime(n)
	return false if n <= 1 # 1 не простое

	# Поиск делителя среди всех чисел от 2 до n/2 
	(2..n/2).each do |i|
		return false if n % i == 0
	end

	# Если делитель не найден, то число простое
	return true
end


# Поиск максимального простого делителя числа
def max_prime_divisor(n)
	return nil if n <= 1

	result = nil

	# Поиск наибольшего среди чисел от 2 до n,
	# которые являются делителями и простыми числами
	(2..n).each do |i|
		if n % i == 0 && is_prime(i)
			result = i
		end
	end

	return result
end


# Произведение всех цифр числа, не делящихся на 5
def not5_digits_mult(n)
	# Искомое произведение
	result = 1

	# С каждой итерацией получаем последнюю цифру
	# и отбрасываем её целочисленным делением на 10
	while n >= 1
		last_digit = n % 10
		if last_digit % 5 != 0
			result *= n % 10 
		end
		n /= 10
	end

	return result
end  


# Проверка работы методов
print "Введите число: "
number = $stdin.gets.chomp.to_i
puts "Максимальный простой делитель #{number}: #{max_prime_divisor(number)}"
puts "Произведение цифр в #{number}, не делящихся на 5: #{not5_digits_mult(number)}"
