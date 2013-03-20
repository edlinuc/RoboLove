class Message < ActiveRecord::Base
  attr_accessible :body, :intended_date, :medium_id, :relation_id, :sent, :subject, :user_id
  validates_presence_of :body, :intended_date, :medium_id, :relation_id, :user_id
  belongs_to :user
  belongs_to :relation
end
