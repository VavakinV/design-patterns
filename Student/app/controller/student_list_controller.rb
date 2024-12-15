require_relative '../view/student_list_view.rb'
require "../models/students_list/students_list.rb"

class Student_list_controller
    def initialize(view)
        self.view = view
        begin
            self.students_list = Students_list.new(Students_list_file_adapter.new(Students_list_file.new('../students.json', Students_list_strategy_JSON.new)))
            self.data_list = Data_list_student_short.new([])
            self.data_list.add_observer(self.view)
        rescue StandardError => e
            self.view.show_error_message("Ошибка при доступе к данным: #{e.message}")
        end
    end

    def refresh_data
        self.students_list.get_k_n_student_short_list(self.view.current_page, self.view.items_per_page - 1, self.data_list)
        self.data_list.count = self.students_list.get_student_short_count
        self.data_list.notify
    end

    def sort_table_by_column(sort_order, col_idx)
        # TODO: добавить сохранение порядка между страницами
        # headers = self.data_list.get_names
        # data = self.data_list.get_data
        # sorted_data = []

        # rows = (1...data.row_count).map do |row_idx|
        #     (0...data.column_count).map {|column_idx| data.get_element(row_idx, column_idx)}
        # end

        # sort_order ||= {}
        # sort_order[col_idx] = !sort_order.fetch(col_idx, false)

        # sorted_rows = rows.sort_by do |row| 
        #     value = row[col_idx]
        #     value.nil? ? "\xFF" * 1000 : value
        # end

        # sorted_rows.reverse! unless sort_order[col_idx]

        # self.view.set_table_params(headers, self.data_list.count)
        # self.view.set_table_data(Data_table.new(sorted_rows))

        # return sort_order
    end

    def create
        puts "Создание записи"
    end

    def update(number)
        return if number.nil?
        puts "Изменение строки с номером: #{number}"
    end

    def delete(numbers)
        return if numbers.nil?
        puts "Удаление строк с номерами #{numbers}"
    end

    private
    attr_accessor :view, :students_list, :data_list
end