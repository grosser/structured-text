class RPXIdentifier < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  serialize :raw, Hash
  
  def self.find_or_create_user(data)
    if identifier = find_by_identifier(data[:identifier])
      identifier.user
    else
      user = User.create!(:name => data[:username], :email => data[:email])
      user.rpx_identifiers.create!(:identifier => data[:identifier], :raw => data[:raw])
      user
    end
  end
end