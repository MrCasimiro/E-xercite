class CreateDiets < ActiveRecord::Migration[5.1]
  def change
    create_table :diets do |t|
      t.text :name
      t.belongs_to :coach, unique: true, foreign_key:true
      t.timestamps
    end
  end
end
