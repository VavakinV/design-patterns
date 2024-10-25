require "./tag.rb"

class HtmlTree
  include Enumerable

  # Доступные теги и атрибуты
  ALLOWED_TAGS = %w[html head body div p h1 h2 ul li a span].freeze
  ALLOWED_ATTRIBUTES = %w[class id href src].freeze

  attr_accessor :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end

  # Парсинг строки HTML
  def parse_html(html_string)
    # Удаление лишних пробелов и получение всех тегов
    tokens = html_string.gsub(/\s+/, ' ').scan(/<\/?[^>]+>/)
    # Текущий тег в переборе
    current_node = nil
    # Стек для хранения тегов
    stack = []

    tokens.each do |token|
      if token =~ /<\/(\w+)>/
        # Если тег закрывающий, то он удаляется из стека и текущим тегом становится предыдущий
        stack.pop
        current_node = stack.last
      elsif token =~ /<(\w+)([^>]*)>/ 
        # Если тег открывающий, то получаем имя тега и строку атрибутов
        tag_name, attributes_string = $1, $2
        # Если тег не входит в разрешенные, переходим к следующему
        next unless ALLOWED_TAGS.include?(tag_name)

        # Парсинг атрибутов тега методом parse_attributes
        attributes = parse_attributes(attributes_string)
        # Создание объекта класса Tag с полученным именем и хэшем атрибутов
        tag = Tag.new(tag_name, attributes)

        if current_node
          # Если стек тегов не пуст, добавляем к текущему тегу наследника
          current_node.add_child(tag)
        else
          # Иначе присваиваем к корню значение тега
          @root = tag
        end

        # Добавление тега в стек
        stack.push(tag)
        current_node = tag
      end
    end
    @root
  end

  # Парсинг атрибутов тега
  # Возвращает хэш вида "название_атрибута"  => "значение"
  def parse_attributes(attributes_string)
    attributes = {}
    attributes_string.scan(/(\w+)="([^"]+)"/).each do |key, value|
      attributes[key] = value if ALLOWED_ATTRIBUTES.include?(key)
    end
    attributes
  end

  # each с обходом в глубину (DFS)
  def each_depth_first(&block)
    traverse_depth_first(@root, &block)
  end

  # Рекурсивный метод для обхода в глубину
  def traverse_depth_first(tag, &block)
    yield tag
    tag.children.each { |child| traverse_depth_first(child, &block) }
  end

  # each с обходом в ширину (BFS)
  def each_breadth_first(&block)
    queue = [@root]
    while !queue.empty?
      tag = queue.shift
      yield tag
      queue.concat(tag.children)
    end
  end

  # Основной each с обходом в глубину по умолчанию
  def each(&block)
    each_depth_first(&block)
  end
end