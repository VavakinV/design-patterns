require "./models/data_list.rb"
require "./models/data_table.rb"
require "./student_short.rb"

class Data_list_student_short < Data_list

    # Получение массива наименований атрибутов, кроме ID
    def get_names
        %w[№ name git contacts]
    end

    # Получение объекта класса Data_Table
    def get_data
        # Первая строка - наименования атрибутов
        # Первый столбец - порядковые номера
        # Остальные столбцы - данные из объектов Student_short
        data_table = [self.get_names]

        data.each_with_index.map do |student_short, index|
            data_table <<
            [
                index + 1,
                student_short.initials,
                student_short.git,
                student_short.contacts
            ]
        end

        Data_table.new(data_table)
    end
end
