class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.string :text
      t.integer :from_uid
      t.integer :to_uid

      t.timestamps
    end
  end
end
