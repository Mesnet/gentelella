class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.datetime :date
      t.boolean :fix
      t.boolean :split
      t.boolean :star
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
