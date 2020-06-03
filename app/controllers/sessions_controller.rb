class SessionsController < ApplicationController
  before_action :already_logged_in, except: [:destroy]
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      create_session(user)
      create_cookies(user)
      redirect_to root_path
      flash['alert-success'] = "Welcome back #{user.name}!"
    else
      flash.now['alert-danger'] = 'Wrong username!'
      render :new
    end
  end

  def destroy
    user = current_user
    log_out if logged_in?
    redirect_to login_path
    flash['alert-success'] = "You have successfully logged out #{user.name}!"
  end
end
