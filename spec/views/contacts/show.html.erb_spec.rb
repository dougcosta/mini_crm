require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/show.html.erb" do
  include ContactsHelper
  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
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

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ email1/)
    response.should have_text(/value\ for\ email2/)
    response.should have_text(/value\ for\ home_page/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ address2/)
    response.should have_text(/1/)
  end
end

