require 'stories/helper'
steps_for(:new_user) do
  Given "the username $user" do |user|
    pending
  end
  Given "the password $password" do |password|
    pending
  end
  Given "the email $email" do |email|
    pending
  end
  When "the login form is submited" do
    pending
  end
  When "the registration form is submited" do
    pending
  end
  When "there is no other user with the same e-mail or email" do
    pending
  end
  When "there is already another user with the same name or email" do
    pending
  end
  Then "the registration should fail" do
    pending
  end
  Then "the registration should be OK" do
    pending
  end
  Then "the registration form should apear again" do
    pending
  end
  Then "the user should be redirected to /" do
    pending
  end
  Then "the login form should be shown again" do
    pending
  end
end

with_steps_for :new_user do
  run "#{dir = File.dirname(__FILE__)}/new_user.txt"
end

