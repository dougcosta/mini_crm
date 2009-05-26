require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/new.html.erb" do
  include CompaniesHelper
  
  before(:each) do
    assigns[:company] = stub_model(Company,
      :new_record? => true,
      :name => "value for name",
      :address => "value for address",
      :home_page => "value for home_page",
      :main_contact => 1,
      :owner => 1
    )
  end

  it "renders new company form" do
    render
    
    response.should have_tag("form[action=?][method=post]", companies_path) do
      with_tag("input#company_name[name=?]", "company[name]")
      with_tag("input#company_address[name=?]", "company[address]")
      with_tag("input#company_home_page[name=?]", "company[home_page]")
      with_tag("input#company_main_contact[name=?]", "company[main_contact]")
      with_tag("input#company_owner[name=?]", "company[owner]")
    end
  end
end


