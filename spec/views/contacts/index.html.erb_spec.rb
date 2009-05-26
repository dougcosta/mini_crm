require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/index.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contacts] = [
      stub_model(Contact,
        :name => "value for name",
        :email => "value for email",
        :email1 => "value for email1",
        :email2 => "value for email2",
        :home_page => "value for home_page",
        :description => "value for description",
        :address => "value for address",
        :address2 => "value for address2",
        :company => 1
      ),
      stub_model(Contact,
        :name => "value for name",
        :email => "value for email",
        :email1 => "value for email1",
        :email2 => "value for email2",
        :home_page => "value for home_page",
        :description => "value for description",
        :address => "value for address",
        :address2 => "value for address2",
        :company => 1
      )
    ]
  end

  it "renders a list of contacts" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for email1".to_s, 2)
    response.should have_tag("tr>td", "value for email2".to_s, 2)
    response.should have_tag("tr>td", "value for home_page".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for address".to_s, 2)
    response.should have_tag("tr>td", "value for address2".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

