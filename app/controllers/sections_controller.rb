class SectionsController < RestController
  before_filter :login_required

  create! do
    LinkHelper.path_for_object(@section.document)
  end

  def inplace
    attribute, id = params[:id].split('_')
    section = Section.find(id)
    section.update_attribute(attribute, params[:value]) if request.post?
    render :text => section[attribute]
  end
end