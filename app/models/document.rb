class Document < ActiveRecord::Base
  belongs_to :user

  def to_param
    "#{id}-#{title.to_slug}"
  end
end