class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper :all

  before_filter :login_required

  protected

  def login_required
    redirect_to new_user_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def access_denied
    flash[:error] = "You do not have access!"
    redirect_to :controller => :user, :action => :new
  end
end
