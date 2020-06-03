class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :already_logged_in, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar = gravatar_for(@user)
    if @user.save
      create_session(@user)
      create_cookies(@user)
      flash['alert-success'] = 'Welcome! You are now a member'
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

    def user_params
      params.required(:user).permit(:name, :username, :email,
                                    :facebook, :twitter,
                                    :linkedin, :avatar,
                                    :password, :password_confirmation)
    end
end
