class Data_List

    def initialize(data)
        self.data = data
    end

    private

    attr_reader :data

    # Сеттер для поля
    def data=(data)
        # Параметр должен быть массивом
        unless data.is_a?(Array)
            raise ArgumentError, 'Переданный параметр должен быть массивом'
        end

        @data = data
    end
end
