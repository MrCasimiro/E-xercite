class CreateUserRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :user_requests do |t|
    	t.date :date
    	t.integer :type
    	t.integer :status
    	t.belongs_to :user, unique: true, foreign_key:true
		t.timestamps
    end
  end
end
