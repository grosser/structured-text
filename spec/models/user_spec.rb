require 'spec/spec_helper'

describe User do
  describe :make_name_url_friendly do
    before do
      User.delete_all
    end

    it "makes empty names to unnamed" do
      user = Factory.build(:user, :name => '')
      user.save!
      user.name.should == 'unnamed'
    end

    it "adds numbers if names are already taken" do
      Factory(:user, :name => 'unnamed')
      Factory(:user, :name => 'unnamed-2')
      user = Factory.build(:user, :name => 'unnamed')
      user.save!
      user.name.should == 'unnamed-3'
    end

    it "removes all-digit names" do
      user = Factory.build(:user, :name => '123')
      user.save!
      user.name.should == 'unnamed'
    end

    it "keeps good names" do
      user = Factory.build(:user, :name => 'test-123-TEST')
      user.save!
      user.name.should == 'test-123-TEST'
    end

    it "removes invalid characters from names" do
      user = Factory.build(:user, :name => ' --äåáðß-- ')
      user.save!
      user.name.should == 'aaadss'
    end
  end
end