class SectionsController < RestController
  before_filter :login_required

  create! do
    LinkHelper.path_for_object(@section.document)
  end

  def inplace
    attribute, id = params[:id].split('_')
    section = Section.find(id)
    if request.post?
      section.update_attribute(attribute, params[:value])
      render :text => section[attribute].markdown_to_html
    else
      render :text => section[attribute]
    end
  end
end