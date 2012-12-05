class UsersController < ApplicationController

  def rsvp

  end

  def confirm_rsvp
    @user = User.find_by_email(params[:email])

    @user.update_attribute(:rsvp, true) if !@user.nil?

    respond_to do |format|
      format.js
    end
  end

  # def match
  #   santas = User.all
  #   receivers = User.all
  #
  #   santas.each do |santa|
  #     receiver = receivers.sample
  #     santa.user = receiver
  #     logger.debug santa.id.to_s + " " + receiver.id.to_s
  #
  #     redo if santa.id == receiver.id
  #
  #     santa.save
  #     receivers = receivers - [receiver]
  #   end
  #
  #   redirect_to users_path
  # end

  def match
    ids = User.all.collect{|u| u.id}

    User.all.each do |user|
      user.update_attribute(:user, nil)
    end

    User.all.each do |user|
      user.user = nil
      ids = ids - [user.id]
      user_id = ids.sample
      logger.debug user_id
      user.user = User.find(user_id)
      ids = ids - [user_id]
      user.save

      if User.where(user_id: user.id).count == 0
        ids << user.id
      end

    end

    redirect_to users_path
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

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
