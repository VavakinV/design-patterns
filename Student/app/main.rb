require 'fox16'
require "../app/view/student_list_view.rb"
include Fox

app = FXApp.new
file_adapter = Students_list_file.new('../students.json', Students_list_strategy_JSON.new)
students_list = Students_list.new(file_adapter)
StudentListView.new(app, file_adapter)
app.create
app.run