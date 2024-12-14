require_relative '../view/student_list_view.rb'

class Student_list_controller
    def initialize(view, students_list)
        self.view = view
        self.students_list = students_list
    end

    def refresh_data
        self.students_list.get_k_n_student_short_list(1, self.students_list.get_student_short_count).get_data
    end

    def sort_table_by_column(data, sort_order, col_idx)
        headers = (0...data.column_count).map {|col_idx| data.get_element(0, col_idx)}

        rows = (1...data.row_count).map do |row_idx|
            (0...data.column_count).map {|column_idx| data.get_element(row_idx, column_idx)}
        end

        sort_order ||= {}
        sort_order[col_idx] = !sort_order.fetch(col_idx, false)

        sorted_rows = rows.sort_by do |row| 
            value = row[col_idx]
            value.nil? ? "\xFF" * 1000 : value
        end

        sorted_rows.reverse! unless sort_order[col_idx]

        return Data_table.new([headers] + sorted_rows), sort_order
    end

    def create
        puts "Создание записи"
    end

    def update(number)
        return if number.nil?
        puts "Изменение строки с номером: #{numbers}"
    end

    def delete(numbers)
        return if numbers.nil?
        puts "Удаление строк с номерами #{numbers}"
    end

    private
    attr_accessor :view, :students_list
end