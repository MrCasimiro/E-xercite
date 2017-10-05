class CreateUserDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :user_diseases do |t|
      t.belongs_to :user, unique: true, foreign_key:true
      t.belongs_to :disease, unique: true, foreign_key:true
      t.timestamps
    end
    add_index :user_diseases, [:user_id, :disease_id], unique: true
  end
end
