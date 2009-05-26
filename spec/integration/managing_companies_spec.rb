require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Managing Companies" do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => "value for address",
      :home_page => "value for home_page",
      :main_contact => 1,
      :owner => 1
    }
  end

  describe "viewing index" do
    it "lists all Companies" do
      company = Company.create!(@valid_attributes)
      visit companies_path
      response.should have_selector("a", :href => company_path(company))
    end
  end
end
