class AddDatedOnToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :dated_on, :date
  end
end
