class CreateUserMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :user_measures do |t|
      t.float :weight
      t.float :height
      t.float :neck
      t.float :chest
      t.float :leftbiceps
      t.float :rightbiceps
      t.float :chest
      t.float :waist
      t.float :hips
      t.float :leftthigh
      t.float :rightthigh
      t.float :leftcalve
      t.float :rightcalve
      t.belongs_to :user, unique: true, foreign_key:true

      t.timestamps
    end
  end
end
