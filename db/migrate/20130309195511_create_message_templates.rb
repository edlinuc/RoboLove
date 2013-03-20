class CreateMessageTemplates < ActiveRecord::Migration
  def change
    create_table :message_templates do |t|
      t.string :subject
      t.string :body
      t.integer :medium_id

      t.timestamps
    end
  end
end
