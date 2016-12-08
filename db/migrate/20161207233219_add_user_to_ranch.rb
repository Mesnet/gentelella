class AddUserToRanch < ActiveRecord::Migration
  def change
    add_column :ranches, :user_id, :integer
  end
end
