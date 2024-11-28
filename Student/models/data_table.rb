class Data_Table
    
    def initialize(data)
        self.data = data
    end


    private

    attr_reader :data
    
    # Сеттер для поля
    def data=(data)
        # Параметр должен быть двумерным массивом
        unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
            raise ArgumentError, 'Data must be a two-dimensional array'
        end

        @data = data
    end
end