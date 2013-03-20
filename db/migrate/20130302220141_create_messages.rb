class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :medium_id
      t.date :intended_date
      t.string :subject
      t.string :body
      t.integer :user_id
      t.integer :relation_id
      t.boolean :sent

      t.timestamps
    end
  end
end
