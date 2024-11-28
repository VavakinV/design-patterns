class Data_List

    def initialize(data)
        self.data = data
        self.selected = []
    end

    # Выбор элемента по номеру
    def select(number)
        unless number.is_a?(Integer) && number >= 0 && number < data.size
            raise ArgumentError, 'Параметр должен быть числом в пределах размера массива'
        end
        self.selected << number unless self.selected.include?(number)
    end

    # Получение ID выбранных элементов
    def get_selected
        self.selected
    end

    # Получение массива наименований атрибутов
    def get_names
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end

    # Получение объекта класса Data_Table
    def get_data
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end

    private

    attr_reader :data
    attr_accessor :selected

    # Сеттер для поля
    def data=(data)
        # Параметр должен быть массивом
        unless data.is_a?(Array)
            raise ArgumentError, 'Переданный параметр должен быть массивом'
        end

        @data = data
    end
end
