class User < ActiveRecord::Base
  attr_accessible :birthdate, :email, :name, :password
  validates_presence_of :email, :name
  validates_uniqueness_of :email
  has_secure_password
  has_many :relations
  has_many :messages
  has_many :friends, :foreign_key => :u_id1
  has_many :users, :through => :friends, :source => :u_id2
end
