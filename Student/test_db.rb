require 'dotenv/load'
require 'pg'

host = ENV['DB_HOST']
port = ENV['DB_PORT']
dbname = ENV['DB_NAME']
user = ENV['DB_USER']
password = ENV['DB_PASSWORD']

# Подключение к базе данных
begin
    connection = PG.connect(
        host: host,
        port: port,
        dbname: dbname,
        user: user,
        password: password
    )

    # Выполнение SELECT запроса
    result = connection.exec("SELECT * FROM student;") # Замените 'your_table' на имя вашей таблицы

    # Вывод результатов
    result.each do |row|
        puts row
    end

ensure
    # Закрытие соединения с базой данных
    connection.close if connection
end