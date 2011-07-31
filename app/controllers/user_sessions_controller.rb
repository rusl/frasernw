class UserSessionsController < ApplicationController
  skip_before_filter :login_required
  def new
    @user_session = UserSession.new
    # render :layout=>false
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = current_user_session
    if @user_session.nil?
      redirect_to '/', :notice => "You are not logged in."
    else
      @user_session.destroy 
      redirect_to '/', :notice => "You have been logged out."
    end
  end
end
