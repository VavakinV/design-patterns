# Получаем имя пользователя в качестве аргумента программы (массив ARGV)
name = ARGV[0]

# Приветствие с форматированием строки
puts "Привет, #{name}!"
print "Какой твой любимый язык программирования: "

# Считывание введённой строки в нижнем регистре
language = $stdin.gets.chomp.downcase

# Вывод ответа на введённую строку
if language == 'ruby'
	puts "Подлиза!"
else
	case language
	when 'python'
		puts "print('Python' + '!' * (0 != 1) * 2 ** 3)"
	when 'c++'
		puts "int a = 5;"
		puts "cout<<a+++a; // ???"
	when 'assembly'
		puts "О, старый друг мой, внук мой славный, слышишь ли ты глас древнего мудреца, тлеющего в мороке времён?"
		puts "Каково это, быть свидетелем измышлений оного, кто мудростью древних книг не насытился, а отыскал покой в тени ржавых регистров и изнурительных циклов ассемблера?"
	when 'php'
		puts "die();"
	end
	puts "Да будет им Ruby!"
end

# Получение команды Ruby от пользователя
print "Введите команду Ruby: "
ruby_command = $stdin.gets.chomp


# Выполнение введённой команды Ruby
begin
  eval(ruby_command)
rescue StandardError => e # Обработка исключения
  puts "Ошибка при выполнении команды Ruby: #{e.message}" 
end

# Получение команды ОС от пользователя
print "\nВведите команду операционной системы для выполнения: "
os_command = $stdin.gets.chomp

# Выполнение введённой команды ОС
begin
  os_output = `#{os_command}`.force_encoding('Windows-1251').encode('UTF-8') # Перевод в UTF-8 для корректного отображения символов
  puts "#{os_output}" 
rescue StandardError => e # Обработка исключения
  puts "Ошибка при выполнении команды ОС: #{e.message}"
end