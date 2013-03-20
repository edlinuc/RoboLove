class MessageMailer < ActionMailer::Base
  

  def mail_message(user, recipient_email, message)
  	@subject=message.subject
  	@body=message.body
  	@user=user
  	mail(:to => recipient_email, :from=>@user.email, :subject => @subject)

  end



end
