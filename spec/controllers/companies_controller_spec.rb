require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'user'

describe CompaniesController do
  before(:each) do
    session[:user] = User.new
  end
 describe "handling GET /companies" do

    before(:each) do
      @company = mock_model(Company)
      Company.stub!(:find).and_return([@company])
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
  
    it "should find all companies" do
      Company.should_receive(:find).with(:all).and_return([@company])
      do_get
    end
  
    it "should assign the found companies for the view" do
      do_get
      assigns[:companies].should == [@company]
    end
  end

  describe "handling GET /companies.xml" do

    before(:each) do
      @companies = mock("Array of Companies", :to_xml => "XML")
      Company.stub!(:find).and_return(@companies)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all companies" do
      Company.should_receive(:find).with(:all).and_return(@companies)
      do_get
    end
  
    it "should render the found companies as xml" do
      @companies.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /companies/1" do

    before(:each) do
      @company = mock_model(Company)
      Company.stub!(:find).and_return(@company)
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
  
    it "should find the company requested" do
      Company.should_receive(:find).with("1").and_return(@company)
      do_get
    end
  
    it "should assign the found company for the view" do
      do_get
      assigns[:company].should equal(@company)
    end
  end

  describe "handling GET /companies/1.xml" do

    before(:each) do
      @company = mock_model(Company, :to_xml => "XML")
      Company.stub!(:find).and_return(@company)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the company requested" do
      Company.should_receive(:find).with("1").and_return(@company)
      do_get
    end
  
    it "should render the found company as xml" do
      @company.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /companies/new" do

    before(:each) do
      @company = mock_model(Company)
      Company.stub!(:new).and_return(@company)
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
  
    it "should create an new company" do
      Company.should_receive(:new).and_return(@company)
      do_get
    end
  
    it "should not save the new company" do
      @company.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new company for the view" do
      do_get
      assigns[:company].should equal(@company)
    end
  end

  describe "handling GET /companies/1/edit" do

    before(:each) do
      @company = mock_model(Company)
      Company.stub!(:find).and_return(@company)
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
  
    it "should find the company requested" do
      Company.should_receive(:find).and_return(@company)
      do_get
    end
  
    it "should assign the found Company for the view" do
      do_get
      assigns[:company].should equal(@company)
    end
  end

  describe "handling POST /companies" do

    before(:each) do
      @company = mock_model(Company, :to_param => "1")
      Company.stub!(:new).and_return(@company)
    end
    
    describe "with successful save" do
  
      def do_post
        @company.should_receive(:save).and_return(true)
        post :create, :company => {}
      end
  
      it "should create a new company" do
        Company.should_receive(:new).with({}).and_return(@company)
        do_post
      end

      it "should redirect to the new company" do
        do_post
        response.should redirect_to(company_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @company.should_receive(:save).and_return(false)
        post :create, :company => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /companies/1" do

    before(:each) do
      @company = mock_model(Company, :to_param => "1")
      Company.stub!(:find).and_return(@company)
    end
    
    describe "with successful update" do

      def do_put
        @company.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the company requested" do
        Company.should_receive(:find).with("1").and_return(@company)
        do_put
      end

      it "should update the found company" do
        do_put
        assigns(:company).should equal(@company)
      end

      it "should assign the found company for the view" do
        do_put
        assigns(:company).should equal(@company)
      end

      it "should redirect to the company" do
        do_put
        response.should redirect_to(company_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @company.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /companies/1" do

    before(:each) do
      @company = mock_model(Company, :destroy => true)
      Company.stub!(:find).and_return(@company)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the company requested" do
      Company.should_receive(:find).with("1").and_return(@company)
      do_delete
    end
  
    it "should call destroy on the found company" do
      @company.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the companies list" do
      do_delete
      response.should redirect_to(companies_url)
    end
  end
end
