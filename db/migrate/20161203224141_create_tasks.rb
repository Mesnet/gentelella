class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.references :ranch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
