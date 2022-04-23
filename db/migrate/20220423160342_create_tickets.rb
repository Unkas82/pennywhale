class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.integer :state, default: 0, null: false
      t.date :due_date
      t.boolean :overdued, default: false

      t.references :sprint, foreign_key: true, index: true
      t.timestamps
    end

    add_index :tickets, :state
    add_index :tickets, :due_date
    add_index :tickets, :overdued
  end
end
