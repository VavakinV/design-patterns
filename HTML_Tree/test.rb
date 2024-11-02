require "./html_tree.rb"

html = "<html><body><div class=\"container\"><p>Hello, world!</p></div><div></div></body></html>"
tree = HtmlTree.new(html)
puts "Метод count для дерева: #{tree.count}"
puts "Метод count с условием (имя div): #{tree.count{|x| x.name == "div"}}"
puts "Количество детей у первого наследника корня: #{tree.root.children[0].count_children}"
puts "Вывод экземпляра дерева в формате строки: #{tree.root}"
puts "Вывод всех элементов дерева с помощью обхода в глубину: "
tree.each{|node| puts node}
puts "Метод has_children для всех элементов дерева: "
tree.each{|node| puts "#{node.name}: #{node.has_children?}"}