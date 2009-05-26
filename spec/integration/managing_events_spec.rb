require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Managing Events" do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :contact => 1,
      :company => 1
    }
  end

  describe "viewing index" do
    it "lists all Events" do
      event = Event.create!(@valid_attributes)
      visit events_path
      response.should have_selector("a", :href => event_path(event))
    end
  end
end
