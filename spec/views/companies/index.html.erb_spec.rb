require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/index.html.erb" do
  include CompaniesHelper
  
  before(:each) do
    assigns[:companies] = [
      stub_model(Company,
        :name => "value for name",
        :address => "value for address",
        :home_page => "value for home_page",
        :main_contact => 1,
        :owner => 1
      ),
      stub_model(Company,
        :name => "value for name",
        :address => "value for address",
        :home_page => "value for home_page",
        :main_contact => 1,
        :owner => 1
      )
    ]
  end

  it "renders a list of companies" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for address".to_s, 2)
    response.should have_tag("tr>td", "value for home_page".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

