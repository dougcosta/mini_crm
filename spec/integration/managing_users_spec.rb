require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Managing Users" do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :login => "value for login",
      :password => "value for password",
      :email => "value for email"
    }
  end

  describe "viewing index" do
    it "lists all Users" do
      user = User.create!(@valid_attributes)
      visit users_path
      response.should have_selector("a", :href => user_path(user))
    end
  end
end
