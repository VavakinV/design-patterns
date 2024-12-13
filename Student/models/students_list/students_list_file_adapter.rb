require_relative './students_list_interface.rb'
require_relative './students_list_file.rb'

class Students_list_file_adapter < Students_list_interface
    def initialize(students_list_file)
        self.adaptee = students_list_file
    end
    
    # Получение студента по ID
    def get_student_by_id(id)
        self.adaptee.get_student_by_id(id)
    end

    # Получение списка k по счету n объектов Student_short в форме Data_list
    def get_k_n_student_short_list(k, n, data_list = nil)
        self.adaptee.get_k_n_student_short_list(k, n, data_list)
    end

    # Добавление нового студента
    def add_student(student)
        self.adaptee.add_student(student)
    end

    # Замена студента по ID
    def replace_student_by_id(id, new_student)
        self.adaptee.replace_student_by_id(id, new_student)
    end

    # Удаление студента по ID
    def delete_student_by_id(id)
        self.adaptee.delete_student_by_id(id)
    end
    
    # Получить количество элементов
    def get_student_short_count
        self.adaptee.get_student_short_count
    end

    private
    attr_accessor :adaptee
end
