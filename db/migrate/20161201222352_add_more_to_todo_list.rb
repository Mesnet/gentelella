class AddMoreToTodoList < ActiveRecord::Migration
  def change
    add_column :todo_lists, :date, :datetime
    add_column :todo_lists, :star, :boolean
    add_column :todo_lists, :split, :boolean
  end
end
