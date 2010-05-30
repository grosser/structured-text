class RestController < ApplicationController
  resource_controller

  protected

  def collection
    @collection ||= current_model.paginate(:per_page => 20, :page => params[:page])
  end
end