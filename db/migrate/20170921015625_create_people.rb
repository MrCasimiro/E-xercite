class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :age
      t.string :gender
      t.string :password_digest

      t.timestamps
    end
  end
end
