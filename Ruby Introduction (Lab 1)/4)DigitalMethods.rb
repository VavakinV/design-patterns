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


# Произведение всех цифр числа
def digits_mult(n)
	# Искомое произведение
	result = 1

	# С каждой итерацией получаем последнюю цифру
	# и отбрасываем её целочисленным делением на 10
	while n >= 1
		last_digit = n % 10
		result *= last_digit 
		n /= 10
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
			result *= last_digit
		end
		n /= 10
	end

	return result
end  


# Поиск максимального непростого нечетного делителя
def max_odd_not_prime_divisor(n)
	result = 1

	# Поиск наибольшего среди чисел от 2 до n,
	# которые являются делителями и нечетными непростыми числами
	(2..n).each do |i|
		if n % i == 0 && !is_prime(i) && i % 2 == 1
			result = i
		end
	end

	return result
end


# НОД максимального нечетного непростого делителя и произведения цифр
def div_mult_gcd(n)
	monpd = max_odd_not_prime_divisor(n)
	dm = digits_mult(n)
	return monpd.gcd(dm)
end

# Проверка работы методов
print "Введите число: "
number = $stdin.gets.chomp.to_i
puts "Метод 1)Максимальный простой делитель #{number}: #{max_prime_divisor(number)}"
puts "Метод 2)Произведение цифр в #{number}, не делящихся на 5: #{not5_digits_mult(number)}"
puts "Максимальный нечетный непростой делитель: #{max_odd_not_prime_divisor(number)}"
puts "Произведение всех цифр #{number}: #{digits_mult(number)}"
puts "Метод 3)НОД максимального нечетного непростого делителя и произведения цифр #{number}: #{div_mult_gcd(number)}"