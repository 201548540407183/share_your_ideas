class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_user,only: [:index]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  if @user.save
    flash[:success] = "Welcome to Share Your Idea. #{@user.username}.Please sign in."
    redirect_to login_path
  else
    render 'new'
  end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "Your account was updated successfully."
    redirect_to articles_path
  else
    render 'edit'
  end
  end

  def show
    @user = User.find(params[:id])
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
