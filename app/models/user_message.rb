class UserMessage < ActiveRecord::Base
  attr_accessible :from_uid, :text, :to_uid
end
