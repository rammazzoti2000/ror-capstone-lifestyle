class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :all_cat

  def logged_in_user
    unless logged_in?
      flash['alert-danger'] = 'You must be logged in to access that page!'
      redirect_to login_path
    end
  end

  def already_logged_in
    if logged_in?
      flash['alert-warning'] = 'You are already logged in!'
      redirect_to root_path
    end
  end

  def all_cat
    @categories = Category.all
  end
end
