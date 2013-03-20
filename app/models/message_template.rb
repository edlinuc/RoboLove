class MessageTemplate < ActiveRecord::Base
  attr_accessible :body, :medium_id, :subject
end
