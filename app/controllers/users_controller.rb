class UsersController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def show
    @user = User.find_by_name(params[:id]) || raise(ActiveRecord::RecordNotFound)
  end

  def index
    @users = User.paginate(:page => params[:page], :per_page => 20)
  end

  def create
    if data = RPXNow.user_data(params[:token], :additional => [:raw], :extended => true)
      self.current_user = RPXIdentifier.find_or_create_user(data)
      redirect_to '/'
    else
      flash[:error] = :default
      redirect_to :action => :new
    end
  end

  def destroy
    self.current_user = nil
    redirect_to :action => :new
  end
end