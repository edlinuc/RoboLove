class UserMessagesController < ApplicationController
  # GET /user_messages
  # GET /user_messages.json
  def index
    @user_messages = UserMessage.find_all_by_to_uid(session[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_messages }
    end
  end

  # GET /user_messages/1
  # GET /user_messages/1.json
  def show
    @user_message = UserMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_message }
    end
  end

  # GET /user_messages/new
  # GET /user_messages/new.json
  def new
    @user_message = UserMessage.new
    @user_message.to_uid = params[:id]
    @user_message.from_uid = session[:user_id]

    respond_to do |format|
      format.js
      format.html # new.html.erb
      format.json { render json: @user_message }
    end
  end

  # GET /user_messages/1/edit
  def edit
    @user_message = UserMessage.find(params[:id])
  end

  # POST /user_messages
  # POST /user_messages.json
  def create
    @user_message = UserMessage.new(params[:user_message])

    respond_to do |format|
      if @user_message.save
        format.js
        format.html { redirect_to @user_message, notice: 'User message was successfully created.' }
        format.json { render json: @user_message, status: :created, location: @user_message }
      else
        format.html { render action: "new" }
        format.json { render json: @user_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_messages/1
  # PUT /user_messages/1.json
  def update
    @user_message = UserMessage.find(params[:id])

    respond_to do |format|
      if @user_message.update_attributes(params[:user_message])
        format.html { redirect_to @user_message, notice: 'User message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_messages/1
  # DELETE /user_messages/1.json
  def destroy
    @user_message = UserMessage.find(params[:id])
    @user_message.destroy

    respond_to do |format|
      format.html { redirect_to user_messages_url }
      format.json { head :no_content }
    end
  end
end
