class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :name
      t.string :email
      t.date :birthdate
      t.date :anniversary
      t.integer :intensity
      t.string :eye_color
      t.string :hair_color
      t.integer :height
      t.integer :weight
      t.integer :user_id
      t.string :phone
      t.timestamps
    end
  end
end
