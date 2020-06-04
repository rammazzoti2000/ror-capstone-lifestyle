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
      flash['alert-success'] = "Right on #{user.name}. Welcome Back!"
    else
      flash.now['alert-danger'] = 'You have typed a wrong user name!'
      render :new
    end
  end

  def destroy
    user = current_user
    log_out if logged_in?
    redirect_to root_path
    flash['alert-success'] = "You have successfully logged out #{user.name}!"
  end
end
