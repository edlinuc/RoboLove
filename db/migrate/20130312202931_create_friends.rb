class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :u_id1
      t.integer :u_id2

      t.timestamps
    end
  end
end
