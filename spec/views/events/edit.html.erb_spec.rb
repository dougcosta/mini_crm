require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/events/edit.html.erb" do
  include EventsHelper
  
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :new_record? => false,
      :title => "value for title",
      :description => "value for description",
      :contact => 1,
      :company => 1
    )
  end

  it "renders the edit event form" do
    render
    
    response.should have_tag("form[action=#{event_path(@event)}][method=post]") do
      with_tag('input#event_title[name=?]', "event[title]")
      with_tag('textarea#event_description[name=?]', "event[description]")
      with_tag('input#event_contact[name=?]', "event[contact]")
      with_tag('input#event_company[name=?]', "event[company]")
    end
  end
end


