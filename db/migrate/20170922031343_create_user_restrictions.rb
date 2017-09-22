class CreateUserRestrictions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_restrictions do |t|
      t.belongs_to :user, unique: true, foreign_key:true
      t.belongs_to :restriction, unique: true, foreign_key:true
      t.timestamps
    end
    add_index :user_restrictions, [:user_id, :restriction_id], unique: true
  end
end
