require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
  before(:each) do
		@event = Evente.new
		User.current_user = users(:one)
  end
  
  it "should set the creator and changer users" do
  	@event.title = "test"
  	@event.description = "test"
  	@event.save!
  	
  	@event.creator.should == users(:one)
  	@event.changer.should == users(:one)
  	@event.description = 'other description'
  	User.current_user = users(:one)
  	@event.save!
  	
  	@event.creator.should == users(:one)
  	@event.changer.should == users(:two)
  end

  it "should require title and description" do
    @event.should_not be_valid
    @event.should have(1).error_on(:title)
    @event.should have(1).error_on(:description)
    @event.title = "test"
    @event.description = "test"
    @event.should be_valid
    @event.should have(:one).errors_on(:title)
    @event.should have(:one).errors_on(:description)
  end
  
  it "should order with a named scope" do
  	Event.lastest.proxy_options.should == { :order => "created_at desc", :conditions => {} }
  end
  
  it "should filter by contact with a named scope" do
  	contact = Contact.new
  	contact.id = 1
  	Event.by_contact(contact).proxy_options.should == { :conditions => ["contact_id = ?", 1] }
  end
  
  it "should filter by company and contact with a named scope" do
  	contact = Contact.new
  	contact.id = 1
  	company = Company.new
  	company.id = 2
  	Event.by_company_except_contact(company, contact).proxy_options.should == { :conditions => ["company_id = ? and contact_id != ?", 2,1] }
  end
end
