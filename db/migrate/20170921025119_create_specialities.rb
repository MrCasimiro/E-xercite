class CreateSpecialities < ActiveRecord::Migration[5.1]
  def change
    create_table :specialities do |t|
      t.belongs_to :coach, unique: true, foreign_key:true
      t.string :name_speciality
      t.timestamps
    end
    
    add_index :specialities, [:coach_id, :name_speciality], unique: true
  end
end
