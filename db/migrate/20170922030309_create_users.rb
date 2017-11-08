class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  	drop_table :users, if_exists: true
    create_table :users do |t|
      t.belongs_to :person, index: { unique: true}, foreign_key:true
      t.integer :level, default: 0
      t.integer :points, default: 0

      t.timestamps
    end
  end
end
