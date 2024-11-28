class Data_Table

    def initialize(data)
        self.data = data
    end

    # Получение элемента по индексу строки и столбца
    def get_element(row_index, column_index)
        self.data[row_index][column_index]
    end

    # Количество строк
    def row_count
        self.data.size
    end

    # Количество столбцов
    def column_count
        self.data.empty ? 0 : self.data[0].size
    end

    private

    attr_reader :data
    
    # Сеттер для поля
    def data=(data)
        # Параметр должен быть двумерным массивом
        unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
            raise ArgumentError, 'Переданный параметр должен быть двумерным массивом'
        end

        @data = data
    end
end