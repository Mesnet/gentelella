class AddInfoToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :date, :date
    add_column :tasks, :star, :boolean, :default => false
    add_column :tasks, :assigned_to, :integer
  end
end
