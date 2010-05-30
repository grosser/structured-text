class Section < ActiveRecord::Base
  belongs_to :document
  belongs_to :parent, :class_name => 'Section'

  acts_as_list
end