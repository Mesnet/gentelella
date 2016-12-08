class CreateRanchstaffs < ActiveRecord::Migration
  def change
    create_table :ranchstaffs do |t|
      t.integer :ranch_id, :null => false
      t.integer :staff_id, :null => false 

      t.timestamps null: false
    end
  end
end
