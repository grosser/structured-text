class Document < ActiveRecord::Base
  belongs_to :user
  has_many :sections

  def to_param
    "#{id}-#{title.to_slug}"
  end
end