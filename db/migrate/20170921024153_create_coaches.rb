class CreateCoaches < ActiveRecord::Migration[5.1]
  def change
    create_table :coaches do |t|
      t.belongs_to :person, index: { unique: true}, foreign_key:true
      t.timestamps
    end
  end
end
