class CreateRanches < ActiveRecord::Migration
  def change
    create_table :ranches do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
