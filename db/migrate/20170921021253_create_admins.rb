class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :adm_password
      t.belongs_to :person, index: { unique: true}, foreign_key:true
      t.timestamps
    end
  end
end
