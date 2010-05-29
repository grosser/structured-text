require 'spec/spec_helper'

describe RPXIdentifier do
  describe :find_or_create_user do
    before do
      RPXIdentifier.delete_all
      User.delete_all
    end

    it "finds existing identifier" do
      rpx_identifier = Factory(:rpx_identifier)
      found = RPXIdentifier.find_or_create_user(:identifier => rpx_identifier.identifier)
      found.rpx_identifiers.should == [rpx_identifier]
    end

    it "creates a new user and identifier" do
      user = RPXIdentifier.find_or_create_user(:identifier => 'MYID', :username => 'NAME', :raw => {:something => true})
      user.name.should == 'NAME'
      user.rpx_identifiers.map(&:identifier).should == ['MYID']
    end
  end
end