class UsersController < RestController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    if data = RPXNow.user_data(params[:token], :additional => :raw)
      self.current_user = RPXIdentifier.find_or_create_user(data)
      User.find_by_identifier(data[:identifier]) || User.create!(data)
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