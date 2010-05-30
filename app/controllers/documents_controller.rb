class DocumentsController < RestController
  before_filter :login_required

  create! do
    LinkHelper.path_for_object(@document)
  end

  protected

  def resource
    @document ||= Document.find(params[:id].to_i)
  end

  def build_resource
    @document ||= Document.new((params[:document]||{}).merge(:user => current_user))
  end
end