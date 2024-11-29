require 'yaml'
require_relative './students_list_strategy.rb'

class Students_list_strategy_YAML < Students_list_strategy
    # Чтение из файла
    def read(file_path)
        content = File.read(file_path)
        student_hashes = YAML.safe_load(content, symbolize_names: true, permitted_classes: [Date, Symbol])

        students = student_hashes.map do |student_hash|
            Student.new(**student_hash)
        end
    end    

    # Чтение из файла
    def write(file_path, students)
        content = students.map { |student| student.to_h }
        File.write(file_path, content.to_yaml)
    end
    
    # Пустой файл
    def empty_content
        [].to_yaml
    end
end
