require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/new.html.erb" do
  include EventsHelper
  
  before(:each) do
    assigns[:event] = stub_model(Event,
      :new_record? => true,
      :title => "value for title",
      :description => "value for description",
      :contact => 1,
      :company => 1
    )
  end

  it "renders new event form" do
    render
    
    response.should have_tag("form[action=?][method=post]", events_path) do
      with_tag("input#event_title[name=?]", "event[title]")
      with_tag("textarea#event_description[name=?]", "event[description]")
      with_tag("input#event_contact[name=?]", "event[contact]")
      with_tag("input#event_company[name=?]", "event[company]")
    end
  end
end


