class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  # FIXME need admin logins

  def index
    @users = User.find(:all)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "User #{@user.login} successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  # def update
  #   @user = current_user
  #   if @user.update_attributes(params[:user])
  #     redirect_to root_url, :notice => "Your profile has been updated."
  #   else
  #     render :action => 'edit'
  #   end
  # end
  
  def show
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :notice => "Successfully destroyed user."
  end
  
end
