class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.integer :age, :limit => 3
      t.string :phone
      t.string :gender
      t.text :lesionHistory
      t.text :diseases
      t.text :restrictions
      t.boolean :coach


      t.timestamps
    end
  end
end
