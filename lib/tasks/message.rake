namespace :message do
    desc "Mass send messages in Messages Model"
    task :send => :environment do
      @date=Time.now.strftime("%Y-%m-%d")
      @messages=Message.find(:all, :conditions=>{:medium_id=>0, :intended_date=>@date})

      @messages.each do |message|
      	relation_email=Relation.find_by_id(message.relation_id).email
      	user=User.find_by_id(message.user_id)
      	if message.sent==false	
      		MessageMailer.mail_message(user, relation_email, message).deliver	
      		Message.find_by_id(message.id).update_attribute(:sent, true)
      	end
      end

      @messages=Message.find(:all, :conditions=>{:medium_id=>1, :intended_date=>@date})
      @messages.each do |message|
      	if message.sent==false
	      	relation_phone=Relation.find_by_id(message.relation_id).phone
	      	@user=User.find_by_id(message.user_id)
	      	message_body=message.body
	      	@client.account.sms.messages.create(
	        from: "+13126141629",
	        to: relation_phone,
	        body: message_body
	      	)
	      	Message.find_by_id(message.id).update_attribute(:sent, true)
	    end

      end

      

    end
end