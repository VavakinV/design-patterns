require 'yaml'
require_relative './students_list.rb'

class Students_list_YAML < Students_list
    # Чтение из файла
    def read
        content = File.read(file_path)
        student_hashes = YAML.safe_load(content, symbolize_names: true, permitted_classes: [Date, Symbol])

        self.students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end    

    # Запись в файл
    def write
        content = students.map { |student| student.to_h }
        File.write(file_path, content.to_yaml)
    end   

    private
    # Пустое содержимое для нового файла (YAML)
    def empty_content
        [].to_yaml
    end
end


