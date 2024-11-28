require "./models/data_list.rb"
require "./models/data_table.rb"
require "./student_short.rb"

class Data_list_student_short < Data_list
    private

    # Переопределяем метод для получения базовых наименований атрибутов
    def base_names
        ["name", "git", "contacts"]
    end

    # Построение строки данных
    def build_row(student_short, index)
        [
            index + 1,                  # Порядковый номер
            student_short.initials,      # ФИО
            student_short.git,           # Git
            student_short.contacts       # Контактные данные
        ]
    end
end
