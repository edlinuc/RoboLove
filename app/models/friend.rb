class Friend < ActiveRecord::Base
  attr_accessible :u_id1, :u_id2

  belongs_to :user#:u_id1, :class_name => :User
  #belongs_to :u_id2, :class_name => :User
  after_create :create_new_friend 

  def create_new_friend
  	if Friend.find_by_u_id1(self.u_id2)==nil
  		Friend.create u_id1: self.u_id2, u_id2: self.u_id1
  	end
  end

end
