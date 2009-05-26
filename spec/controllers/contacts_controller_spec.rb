require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactsController do
  before(:each) do
    session[:user] = User.new
  end
  describe "handling GET /contacts" do

    before(:each) do
      @contact = mock_model(Contact)
      Contact.stub!(:find).and_return([@contact])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all contacts" do
      Contact.should_receive(:find).with(:all).and_return([@contact])
      do_get
    end
  
    it "should assign the found contacts for the view" do
      do_get
      assigns[:contacts].should == [@contact]
    end
  end

  describe "handling GET /contacts.xml" do

    before(:each) do
      @contacts = mock("Array of Contacts", :to_xml => "XML")
      Contact.stub!(:find).and_return(@contacts)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all contacts" do
      Contact.should_receive(:find).with(:all).and_return(@contacts)
      do_get
    end
  
    it "should render the found contacts as xml" do
      @contacts.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /contacts/1" do

    before(:each) do
      @contact = mock_model(Contact)
      Contact.stub!(:find).and_return(@contact)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the contact requested" do
      Contact.should_receive(:find).with("1").and_return(@contact)
      do_get
    end
  
    it "should assign the found contact for the view" do
      do_get
      assigns[:contact].should equal(@contact)
    end
  end

  describe "handling GET /contacts/1.xml" do

    before(:each) do
      @contact = mock_model(Contact, :to_xml => "XML")
      Contact.stub!(:find).and_return(@contact)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the contact requested" do
      Contact.should_receive(:find).with("1").and_return(@contact)
      do_get
    end
  
    it "should render the found contact as xml" do
      @contact.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /contacts/new" do

    before(:each) do
      @contact = mock_model(Contact)
      Contact.stub!(:new).and_return(@contact)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new contact" do
      Contact.should_receive(:new).and_return(@contact)
      do_get
    end
  
    it "should not save the new contact" do
      @contact.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new contact for the view" do
      do_get
      assigns[:contact].should equal(@contact)
    end
  end

  describe "handling GET /contacts/1/edit" do

    before(:each) do
      @contact = mock_model(Contact)
      Contact.stub!(:find).and_return(@contact)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the contact requested" do
      Contact.should_receive(:find).and_return(@contact)
      do_get
    end
  
    it "should assign the found Contact for the view" do
      do_get
      assigns[:contact].should equal(@contact)
    end
  end

  describe "handling POST /contacts" do

    before(:each) do
      @contact = mock_model(Contact, :to_param => "1")
      Contact.stub!(:new).and_return(@contact)
    end
    
    describe "with successful save" do
  
      def do_post
        @contact.should_receive(:save).and_return(true)
        post :create, :contact => {}
      end
  
      it "should create a new contact" do
        Contact.should_receive(:new).with({}).and_return(@contact)
        do_post
      end

      it "should redirect to the new contact" do
        do_post
        response.should redirect_to(contact_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @contact.should_receive(:save).and_return(false)
        post :create, :contact => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /contacts/1" do

    before(:each) do
      @contact = mock_model(Contact, :to_param => "1")
      Contact.stub!(:find).and_return(@contact)
    end
    
    describe "with successful update" do

      def do_put
        @contact.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the contact requested" do
        Contact.should_receive(:find).with("1").and_return(@contact)
        do_put
      end

      it "should update the found contact" do
        do_put
        assigns(:contact).should equal(@contact)
      end

      it "should assign the found contact for the view" do
        do_put
        assigns(:contact).should equal(@contact)
      end

      it "should redirect to the contact" do
        do_put
        response.should redirect_to(contact_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @contact.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /contacts/1" do

    before(:each) do
      @contact = mock_model(Contact, :destroy => true)
      Contact.stub!(:find).and_return(@contact)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the contact requested" do
      Contact.should_receive(:find).with("1").and_return(@contact)
      do_delete
    end
  
    it "should call destroy on the found contact" do
      @contact.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the contacts list" do
      do_delete
      response.should redirect_to(contacts_url)
    end
  end
end
