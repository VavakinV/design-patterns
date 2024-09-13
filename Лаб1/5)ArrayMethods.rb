# Поиск минимального элемента
def find_min(arr)
  # По умолчанию первый элемент минимальный
  min = arr[0]

  # Проход по всем элементам массива
  for i in 1...arr.size
    min = arr[i] if (arr[i] < min)
  end

  return min
end


# Поиск всех положительных элементов
def find_positive(arr)
  positive_elements = []

  # Проход по всем элементам массива
  for i in 0...arr.size
    positive_elements.append(arr[i]) if arr[i] > 0 # элемент добавляется к возвращаемому массиву, если он положительный
  end
  return positive_elements
end


# Номер первого положительного элемента
def find_first_positive_index(arr)
  # Проход по всем элементам массива
  for i in 0...arr.size
    return i if arr[i] > 0
  end
  return nil # Если нет положительных
end