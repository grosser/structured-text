require 'spec/spec_helper'

describe SectionsController do
  describe 'inplace' do
    before do
      controller.stub!(:current_user).and_return Factory(:user)
    end

    it "get`s pure text" do
      section = Factory(:section, :text => '**TEST**')
      get :inplace, :id => "text_#{section.id}"
      response.body.should == section.text
    end

    it "responds to posts`s with html" do
      section = Factory(:section)
      post :inplace, :id => "text_#{section.id}", :value => '**TEST**'
      response.body.should == "<p><strong>TEST</strong></p>\n"
    end
  end
end