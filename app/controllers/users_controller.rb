class UsersController < ApplicationController
  before_action :logged_in_user, except: %i[new create]
  before_action :already_logged_in, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      create_session(@user)
      create_cookies(@user)
      flash['alert-success'] = 'Welcome to the great Lifestyle platform'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @articles = @user.articles
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash['alert-success'] = 'User updated succesfully'
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.required(:user).permit(:name, :username, :email,
                                  :twitter, :linkedin, :avatar,
                                  :password, :password_confirmation)
  end
end
