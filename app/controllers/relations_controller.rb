class RelationsController < ApplicationController
  # GET /relations
  # GET /relations.json
  def index
    @relations = Relation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relations }
    end
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
    @relation = Relation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/new
  # GET /relations/new.json
  def new
    @relation = Relation.new(user_id: session[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = Relation.find(params[:id])
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.new(params[:relation])

    respond_to do |format|
      if @relation.save
        format.html { redirect_to "/users/#{session[:user_id]}", notice: 'Relation was successfully created.' }
        format.json { render json: @relation, status: :created, location: @relation }
      else
        format.html { render action: "new" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relations/1
  # PUT /relations/1.json
  def update
    @relation = Relation.find(params[:id])

    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        format.html { redirect_to @relation, notice: 'Relation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation = Relation.find(params[:id])
    relation_id=params[:id]
    #relation_email=@relation.email
    #@user=User.find(session[:user_id])
    #message=Message.new :subject=>"This isn't working", :body=>"Sorry this just isn't working.  We are done."
    #MessageMailer.mail_message(@user, relation_email, message).deliver
    Message.delete_all(['relation_id= ?', relation_id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to user_url(session[:user_id]) }
      format.json { head :no_content }
    end
  end


end
