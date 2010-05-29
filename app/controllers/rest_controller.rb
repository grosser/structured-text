class RestController < ApplicationController
  make_resourceful do
    actions :show, :index, :edit, :destroy, :update, :new, :create

    #fixed "No item found" bug, http://groups.google.com/group/make_resourceful/browse_thread/thread/053e65eaf72d2cf2#
    response_for :show_fails do
      raise $!
    end
  end

  def current_objects
    @current_objects = current_model.paginate(:per_page => 20, :page => params[:page])
  end
end