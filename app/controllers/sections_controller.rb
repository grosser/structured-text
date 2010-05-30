class SectionsController < RestController
  before_filter :login_required

  create! do
    LinkHelper.path_for_object(@section.document)
  end
end