require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/companies/show.html.erb" do
  include CompaniesHelper
  before(:each) do
    assigns[:company] = @company = stub_model(Company,
      :name => "value for name",
      :address => "value for address",
      :home_page => "value for home_page",
      :main_contact => 1,
      :owner => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ home_page/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

