class Relation < ActiveRecord::Base
  attr_accessible :anniversary, :birthdate, :email, :eye_color, :hair_color, :height, :intensity, :name, :user_id, :weight, :phone
  validates_presence_of :email, :intensity, :name, :user_id, :phone
  belongs_to :user
  has_many :messages
  after_create :populate
  after_destroy :send_break_up_email

  def send_break_up_email
    relation_email=self.email
    user=User.find(self.user_id)
    message=Message.new :subject=>"This isn't working", :body=>"Sorry this just isn't working.  We are done."
    MessageMailer.mail_message(user, relation_email, message).deliver
    puts "mailed"
  end




    def populate
      intensity=self.intensity
      num_messages=0
      if intensity==1
        num_messages=10
      elsif intensity==2
        num_messages=20
      elsif intensity==4
        num_messages=30
      elsif intensity==5
        num_messages=40
      end
      num_messages.times do 
        Message.create(medium_id: rand(2), intended_date: rand(30).day.from_now.strftime("%Y-%m-%d"), subject: MessageTemplate.find(rand(MessageTemplate.count)+1).subject, body: MessageTemplate.find(rand(MessageTemplate.count)+1).body,
                       user_id: self.user_id, relation_id: self.id, sent: false)
      end

    end 
end
