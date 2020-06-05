class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :all_cat

  def logged_in_user
    return if logged_in?

    flash['alert-danger'] = 'You must be logged in to access that page!'
    redirect_to login_path
  end

  def already_logged_in
    return unless logged_in?

    flash['alert-warning'] = 'You are already logged in!'
    redirect_to root_path
  end

  def all_cat
    @categories = Category.all
  end
end
