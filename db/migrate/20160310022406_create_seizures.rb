class CreateSeizures < ActiveRecord::Migration
  def change
    create_table :seizures do |t|
      t.datetime :date
      t.integer :length
      t.text :notes
      t.boolean :medicine_taken

      t.timestamps null: false
    end
  end
end
