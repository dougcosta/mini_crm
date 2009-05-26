require 'stories/helper'
steps_for(:contact_registration) do
  Given "the company name $comp" do |company_name|
    pending
  end
  Given "the company information: address $addr and home page $home_page" do |address, home_page|
    pending
  end
  Given "the contact name $name" do |name|
    pending
  end
  Given "the contact information: email $email, home page $home_page, address $address" do |email, home_page, address|
    pending
  end
  Then "the contact registration form should apear" do
    pending
  end
  Then "a new contact for that company should be created" do
    pending
  end
  Then "no results should be returned" do
    pending
  end
  Then "the company page should appear" do
    pending
  end
  Then "the new contact should be listed in the page" do
    pending
  end
  Then "the selected contact should be set as the company main contact" do
    pending
  end
  When "the client company registration form is submited" do
    pending
  end
  When "the contact creation button is clicked" do
    pending
  end
  When "the \"main contact\" link is clicked for a company contact" do
    pending
  end
  When "the new contact link is followed" do
    pending
  end
  When "the search form is submited" do
    pending
  end
end

with_steps_for :contact_registration do
  run "#{dir = File.dirname(__FILE__)}/contact_registration.txt"
end

