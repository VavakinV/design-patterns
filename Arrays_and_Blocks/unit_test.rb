def unit_test(expected:, test_element:)
	begin
		result = yield(test_element)
	rescue Error
		result = "error"
	end
	"Результат: #{result == "error" ? "ЗАВЕРШЕНО С ОШИБКОЙ" : expected == result ? "ПРОЙДЕН" : "НЕ ПРОЙДЕН" }, Ожидается: #{expected}, Получено: #{result}"
end