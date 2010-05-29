class User < ActiveRecord::Base
  validates_format_of :name, :with => /^[a-zA-Z][-a-zA-Z\d]*[a-zA-Z\d]$/, :if => :name_changed?
  validates_uniqueness_of :name, :if => :name_changed?
  before_validation :make_name_url_friendly, :on => :create

  has_many :rpx_identifiers, :class_name => 'RPXIdentifier'
  has_many :documents

  def to_param
    name
  end

  private

  def make_name_url_friendly
    raise unless new_record?

    self.name = 'unnamed' if name.blank? or name =~ /^\d*$/ 
    self.name = name.to_slug

    counter = 2
    original_name = name
    while someone_has_this_name
      self.name = "#{original_name}-#{counter}".to_slug
      counter += 1
    end
  end

  def someone_has_this_name
    self.class.first(:conditions => {:name => name})
  end
end