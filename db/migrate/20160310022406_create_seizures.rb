class CreateSeizures < ActiveRecord::Migration
  def change
    create_table :seizures do |t|
      t.date :date
      t.time :time
      t.integer :minutes
      t.integer :seconds
      t.text :notes
      t.boolean :medicine_taken

      t.timestamps null: false
    end
  end
end
