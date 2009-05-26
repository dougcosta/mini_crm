require 'stories/helper'
steps_for(:contact_event_managenment) do
  Given "the company name \"My Client\"" do
    pending
  end
  Given "the contact information: email $email, home page $page, address $address" do |email,page,address|
    pending
  end
  Given "the contact name $name" do |name|
    pending
  end
  Given "the event description $description" do
    pending
  end
  Then "it should be the first record on the page" do
    pending
  end
  Then "the contact event history for the informed contact should be shown" do
    pending
  end
  Then "the contact history page for the new contact should appear" do
    pending
  end
  Then "the last log for this contact should apear in the contact history page" do
    pending
  end
  Then "the last logs from other contacts in the same company should appear in the page" do
    pending
  end
  Then "the system should ask if I want to register a new contact for the same client" do
    pending
  end
  When "the confirmation button is pressed" do
    pending
  end
  When "the register button is pressed" do
    pending
  end
  When "the search form is submited" do
    pending
  end
end

with_steps_for :contact_event_managenment do
  run "#{dir = File.dirname(__FILE__)}/contact_event_managenment.txt"
end

