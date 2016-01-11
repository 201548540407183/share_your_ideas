class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_user_name
    if logged_in?
      user = User.find_by(id: session[:user_id])
      return user.username
    end
  end
  def require_user
    if !logged_in?
      flash[:danger] = "You must be sign in to perform that action."
      redirect_to login_path
    end
  end
  def user_right
    if @article.user !=current_user
      flash[:danger] = "You have no right to edit others article."
      redirect_to articles_path(@articles)
    end
  end
end
