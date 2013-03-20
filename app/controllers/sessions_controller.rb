class SessionsController < ApplicationController

def new
  
end

  def create
    user = User.find_by_email(params[:email])
    if user.present?
      if user.authenticate(params[:password])
        
        session[:user_id] = user.id
        puts "worked"
        redirect_to root_url
        return
      end
    end

    redirect_to sign_in_url, notice: "Nice try!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Goodbye!"
  end



end
