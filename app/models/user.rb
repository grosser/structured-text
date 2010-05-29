class User < ActiveRecord::Base
  validates_format_of :name, :with => /^[a-zA-Z][-a-zA-Z\d]*[a-zA-Z\d]$/, :if => :name_changed?
  validates_uniqueness_of :name, :if => :name_changed?
  before_validation :make_name_url_friendly, :on => :create

  private

  def make_name_url_friendly
    raise unless new_record?

    self.name = 'unnamed' if name.blank? or name =~ /^\d*$/ 
    self.name = clean_name(name)

    counter = 2
    original_name = name
    while someone_has_this_name
      self.name = clean_name("#{original_name}-#{counter}")
      counter += 1
    end
  end

  def clean_name(name)
    name = name.to_ascii
    name = name.gsub(/[^-a-zA-Z\d]/, '-')
    name = name.gsub(/-+/,'-') # --- -> -
    name.gsub(/^-+/,'').gsub(/-+$/,'') # --a-- -> a
  end

  def someone_has_this_name
    self.class.first(:conditions => {:name => name})
  end
end