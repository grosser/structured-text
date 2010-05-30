class RestController < ApplicationController
  inherit_resources
  include InheritedResources::DSL

  protected

  def collection
    @collection ||= resource_class.paginate(:per_page => 20, :page => params[:page])
  end
end