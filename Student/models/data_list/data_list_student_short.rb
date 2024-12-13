require_relative "./data_list.rb"
require_relative "../data_table/data_table.rb"
require_relative "../student_short/student_short.rb"

class Data_list_student_short < Data_list
    private

    # Переопределяем метод для получения базовых наименований атрибутов
    def base_names
        ["name", "git", "contacts"]
    end

    # Построение строки данных
    def build_row(student_short, index)
        [
            index + 1 + offset,          # Порядковый номер с учётом смещения
            student_short.initials,      # ФИО
            student_short.git,           # Git
            student_short.contacts       # Контактные данные
        ]
    end
end
