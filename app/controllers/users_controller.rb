class UsersController < ApplicationController
  # GET /users
  # GET /users.json

before_filter :authorize_user, :only => [:edit, :update, :destroy]

#before_filter :authorize_index, :only => [:index]
  def authorize_index
    if @session == nil or @session[:user_id] == nil
      redirect_to login_url, notice: "Unauthorized access"
    end
  end


  def authorize_user
    @user2 = User.find(params[:id])
    if @user2.id != session[:user_id]
      redirect_to root_url, notice: "Unauthorized access"
    end
  end


  def index
    
    @users = User.all
    friends = []
    friends_id=User.find(session[:user_id]).friends
    friends_id.each do |f|
      friends << User.find(f.u_id2)
    end
    @users = @users-friends
    @users.delete User.find(session[:user_id])
    #@users.each do |user|
    #  if user.id=session[:user_id] or user.id 


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    @friends=@user.friends
    @friends1=[]
    @friends.each do |friend|
      @friends1<< User.find(friend.u_id2)
    end


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
