class Data_list

    def initialize(data, offset = 0)
        self.data = data
        self.selected = []
        self.offset = offset
        self.observers = []
        self.count = 0
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
        column_names = ['№'] # нулевой столбец - порядковый номер
        base_names.each do |name| 
            column_names << name
        end
        column_names
    end

    # Получение объекта класса Data_Table
    def get_data
        data_table = [get_names]  # Первая строка с названиями атрибутов
        data.each_with_index do |item, index|
            data_table << build_row(item, index)
        end
        Data_table.new(data_table)
    end

    # Сеттер для поля
    def data=(data)
        # Параметр должен быть массивом
        unless data.is_a?(Array)
            raise ArgumentError, 'Переданный параметр должен быть массивом'
        end

        @data = data
    end

    # Сеттер для смещения (при пагинации)
    def offset=(offset)
        unless offset.is_a?(Integer) && offset >= 0
            raise ArgumentError, 'Offset должен быть неотрицательным числом'
        end
        @offset = offset
    end

    def notify
        return if observers.nil?
        observers.each do |observer|
            observer.set_table_params(self.get_names, self.count)
            observer.set_table_data(self.get_data)
        end
    end

    def add_observer(observer)
        self.observers << observer
    end

    attr_accessor :count

    private
    
    attr_reader :data, :offset
    attr_accessor :selected, :observers

    # Абстрактный метод получения имен атрибутов
    def base_names
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end    

    # Абстрактный метод построения строки данных
    def build_row(item, index)
        raise NotImplementedError, 'Метод не реализован в данном классе'
    end    
end
