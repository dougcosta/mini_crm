require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/new.html.erb" do
  include ContactsHelper
  
  before(:each) do
    assigns[:contact] = stub_model(Contact,
      :new_record? => true,
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
  end

  it "renders new contact form" do
    render
    
    response.should have_tag("form[action=?][method=post]", contacts_path) do
      with_tag("input#contact_name[name=?]", "contact[name]")
      with_tag("input#contact_email[name=?]", "contact[email]")
      with_tag("input#contact_email1[name=?]", "contact[email1]")
      with_tag("input#contact_email2[name=?]", "contact[email2]")
      with_tag("input#contact_home_page[name=?]", "contact[home_page]")
      with_tag("textarea#contact_description[name=?]", "contact[description]")
      with_tag("input#contact_address[name=?]", "contact[address]")
      with_tag("input#contact_address2[name=?]", "contact[address2]")
      with_tag("input#contact_company[name=?]", "contact[company]")
    end
  end
end


