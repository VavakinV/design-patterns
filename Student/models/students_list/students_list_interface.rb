# Общий интерфейс Students_list
class Students_list_interface
    def get_student_by_id(id)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end

    def get_k_n_student_short_list(k, n, data_list = nil)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end

    def add_student(student)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end

    def replace_student(id, new_student)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end

    def delete_student(id)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end

    def get_student_short_count(filter = nil)
        raise NotImplementedError, "Метод не реализован в интерфейсе"
    end
end