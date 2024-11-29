require 'json'
require_relative './students_list.rb'

class Students_list_JSON < Students_list
    # Чтение из файла
    def read
        content = File.read(file_path)
        student_hashes = JSON.parse(content, symbolize_names: true)

        self.students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end    

    # Запись в файл
    def write
        content = students.map { |student| student.to_h }
        File.write(file_path, JSON.pretty_generate(content))
    end   

    private
    # Пустое содержимое для нового файла (JSON)
    def empty_content
        [].to_json
    end
end
