require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'user'

describe User do
	fixtures :users
  before(:each) do
		@user = User.new
  end

  it "should ignore mass assignment to protected fields" do
    @user = User.new :crypted_password => 'test', :login => 'other'
    @user.crypted_password.should be_nil
    @user.login.should be_nil
  end
  
  it "should validate correctly"
  	@user.should_not be_valid
  	@user.should have(4).errors_on(:login)
  	@user.should have(2).errors_on(:email)

  	@user.name = 'test1'
  	@user.login = 'test1'
  	@user.password = 't'
  	@user.email = 'user1@test.com'
  	@user.should_not be_valid
  	@user.should_not have(2).errors_on(:password)
  	@user.should_not have(:no).errors_on(:login)
  	@user.should_not have(:no).errors_on(:email)
  	
  	@user.password = 'test'
  	@user.password_confirmation = 'tes'
  	@user.should_not be_valid
  	
  	@user.password_confirmation = 'test'
  	@user.should be_valid
  end
  
  it "should crypt the password" do
  	@user.name = 'test2'
  	@user.password = 'test5'
  	@user.email = 'user2@test.com'
  	@user.login = 'test2'
  	@user.should be_valid
  	@user.save!
  	@user.crypted_password.should == Digest::SHA1.hexdigest('test5')
  end
  
  it "should validate the uniqueness of login and email" do
  	@user.name = 'test2'
  	@user.password = 'test5'
  	@user.email = 'userone@test.com'
  	@user.login = 'userone'
  	@user.should_not be_valid
  	
  	@user.email = 'user2.1@test.com'
  	@user.login = 'test2.1'
  	@user.should be_valid
  end
  
  it "should login with correct credentiald" do
  	User.logon('userone', 'test').should_not be_nil
  end
  
  it "should register create and update objects" do
  	User.current_user = users(:one)
  	@company = Company.new
  	@company.name = "Test Company unique asdaf"
  	@company.address = "any address"
  	@company.save!
  	
  	@contact = Contact.new
  	@contact.name = "asda12"
  	@contact.address = "asda12"
  	@contact.email = "adsdsds12@mas.ca"
  	@contact.since = Date.today
  	@contact.save!
  	
  	@event = Event.new
  	@event.title = "test2"
  	@event.description = "test2"
  	@event.save!
  	
  	@user = User.find users(:one).id
  	@user.created_companies.should have(1).items
  	@user.created_contacts.should have(1).items
  	@user.created_events.should have(1).items
end
