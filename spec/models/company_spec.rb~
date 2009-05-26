require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Company do
  before(:each) do
    @company = Company.new
    User.current_user = users(:one)
  end
  
  it "should set the creator and changer users" do
  	@company.name = "Test Company unique asda"
  	@company.address = "any address"
  	@company.should be_valid
  	@company.save!
  	
  	@company.creator.should == users(:one)
  	@company.changer.should == users(:one)
  	@company.address = "others address"
  	
  	User.current_user = users(:two)
  	@company.save!
  	@company.creator.should == users(:one)
  	@company.changer.should == users(:two)
  end

  it "should not be valid without attributes" do
    @company.should_not be_valid
  end
  
  it "should validate name" do
  	@company.should_not be_valid
  	@company.should have(2).errors_on(:name)
  	@company.name = "a"
  	@company.should_not be_valid
  	@company.should have(1).error_on(:name)
  	@company.name = "as"
  	@company.should have(:no).error_on(:name)
  end
  
  it "should validate the address" do
  	@company.should_not be_valid
  	@company.should have(1).error_on(:address)
  	@company.address = "a"
  	@company.should_not be_valid
  	@company.should have(:no).error_on(:address)
  end
  
  it "should validate the home page if provided" do
  	@company.should_not be_valid
  	@company.should have(:no).error_on(:home_page)
  	
  	@company.home_page = "a"
  	@company.should_not be_valid
  	@company.should have(1).error_on(:home_page)
  	
  	@company.home_page = "ftp://test"
  	@company.should_not be_valid 
  	@company.should have(1).error_on(:home_page)
  	
  	@company.home_page = "ftp://test.com"
  	@company.should_not be_valid 
  	@company.should have(1).error_on(:home_page)
  	
  	@company.home_page = "http://test"
  	@company.should_not be_valid 
  	@company.should have(1).error_on(:home_page)
  	
  	@company.home_page = "http://test.com"
  	@company.should_not be_valid 
  	@company.should have(:no).error_on(:home_page)
  	
  	@company.home_page = "http://test.com.br"
  	@company.should_not be_valid 
  	@company.should have(:no).error_on(:home_page)
  	
  	@company.home_page = "http://test.info"
  	@company.should_not be_valid 
  	@company.should have(:no).error_on(:home_page)  	  	
  end
  
  it "should validate if the owner belongs to the company" do 
  	@company.name = "Test Company #{rand}"
  	@company.address = "any address"
  	@company.owner = Contact.new :name => "A contact"
  	@company.should be_valid
  	@company.save!
  	
  	@company = Company.find @company.id
  	@company.owner.should be_nil
  	@company.create_owner :name => "Another contact"
  	@company.save!
  	
  	@company = Company.find @company.id
  	@company.owner.should be_nil
  	@company.owner = @company.employees.build :name=> "company owner"
  	@company.save!

  	@company = Company.find @company.id
  	@company.owner.should be_nil
  	@company.owner.company_id.should == @company.id
  end
  
  it "should validate if the main contact belongs to the company" do
  	@company.name = "Test Company #{rand}"
  	@company.address = "any address"
  	@company.owner = Contact.new :name => "A contact"
  	@company.should be_valid
  	@company.save!
  	
  	@company = Company.find @company.id
  	@company.main_contact.should be_nil
  	@company.create_main_contact :name => "Another contact"
  	@company.save!
  	
  	@company = Company.find @company.id
  	@company.main_contact.should be_nil
  	@company.main_contact = @company.employees.build :name=> "company owner"
  	@company.save!

  	@company = Company.find @company.id
  	@company.main_contact.should be_nil
  	@company.main_contact.company_id.should == @company.id
  end
  
  it "should validate uniqueness of the company name" do
  	@company.name = "Test Company unique"
  	@company.address = "any address"
  	@company.should be_valid
  	@company.save!
 	
  	@company = Company.new
  	@company.name = "The Company unique"
  	@company.address = "any address"
  	@company.should be_valid
  end
  
  it "should validate if the owner belongs to the company" do
  	@company.name = "Test Company #{rand}"
  	@company.address = "any address"
  	@company.owner = Contact.new 	:name => "A contact",
  																:email => "any#{rand}@any.com",
  																:address => "address",
  																:since => Date.today
  	@company.should_not be_valid
  	@company.create_owner :name => "Another contact"
  	@company.should_not be_valid
  	
  	@company.owner = @company.employees.build :name => "company owner",
				  	  																:email => "any#{rand}@any.com",
																							:address => "address",
																							:since => Date.today
  	@company.should be_valid
  	@company.save!
  	
  	@company = Company.find @company.id
  	@company.owner.should_not be_nil
  	@company.owner.company_id.should == @company.id
  end
  
  it "should validate if the main contact belongs to the company" do
  	@company.name = "Test Company #{rand}"
  	@company.address = "any address"
  	@company.owner = Contact.new  :name => "A contact",
  																:email => "any#{rand}@any.com",
  																:address => "address",
  																:since => Date.today
  																
  	@company.should_not be_valid
  	@company.create_main_contact :name = "Another contact"
  	@company.should_not be_valid
  	@company.main_contact = @company.employees.build 	:name => "company owner",
																											:email => "any#{rand}@any.com",
																											:address => "address",
																											:since => Date.today
  	@company.should be_valid
  	@company.save!
  	@company = Company.find @company.id
  	@company.main_contact.should_not be_nil
  	@company.main_contact.company_id.should == @company.id  	
  end
end
