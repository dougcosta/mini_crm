require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Managing Contacts" do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :since => Date.today,
      :email => "value for email",
      :email1 => "value for email1",
      :email2 => "value for email2",
      :home_page => "value for home_page",
      :description => "value for description",
      :address => "value for address",
      :address2 => "value for address2",
      :company => 1
    }
  end

  describe "viewing index" do
    it "lists all Contacts" do
      contact = Contact.create!(@valid_attributes)
      visit contacts_path
      response.should have_selector("a", :href => contact_path(contact))
    end
  end
end
