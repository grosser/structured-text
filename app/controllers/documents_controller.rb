class DocumentsController < RestController
  before_filter :login_required

  create do
    redirect_to LinkHelper.path_for_object(@document)
  end

  protected

  def object
    raise
    @object ||= Document.find(params[:id]).to_i
  end

  def build_object
    @object ||= Document.new((params[:document]||{}).merge(:user => current_user))
  end
end