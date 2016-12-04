class AddDoneToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_at, :datetime
    add_column :tasks, :done, :boolean, :default => false
  end
end
