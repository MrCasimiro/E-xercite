class CreateDietComposes < ActiveRecord::Migration[5.1]
  def change
    create_table :diet_composes do |t|
      t.integer :quantity
      t.time :hour
      t.date :day
      t.belongs_to :food, unique: true, foreign_key: true
      t.belongs_to :diet, unique: true, foreign_key: true

      t.timestamps
    end
    add_index :diet_composes, [:diet_id, :food_id], unique: true
  end
end
