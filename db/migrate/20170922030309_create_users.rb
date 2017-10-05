class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  	drop_table :users
    create_table :users do |t|
      t.belongs_to :person, index: { unique: true}, foreign_key:true
      t.integer :level
      t.integer :points

      t.timestamps
    end
  end
end
