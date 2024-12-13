require 'fox16'
require "../app/view/student_list_view.rb"
require "../models/students_list/students_list.rb"
include Fox

app = FXApp.new
file_processor = Students_list_file.new('../students.json', Students_list_strategy_JSON.new)
adapter = Students_list_file_adapter.new(file_processor)
students_list = Students_list.new(adapter)
StudentListView.new(app, students_list)
app.create
app.run