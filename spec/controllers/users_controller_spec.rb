require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  fixtures :users
  before(:each) do
    session[:user] = User.new
  end
  describe "handling GET /users" do

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

    it "should assign the found users for the view" do
      do_get
      assigns[:users].should == [users(:one), users(:two)]
    end
  end

  describe "handling GET /users.xml" do

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the found users as xml" do
      do_get
      response.body.should == User.find(:all).to_xml
    end
  end

  describe "handling GET /users/1" do

    def do_get
      get :show, :id => users(:one).id.to_s
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render show template" do
      do_get
      response.should render_template('show')
    end


    it "should assign the found user for the view" do
      do_get
      assigns[:user].should eql(users(:one))
    end
  end

  describe "handling GET /users/1.xml" do

    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => users(:one).id.to_s
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render the found user as xml" do
      do_get
      response.body.should == users(:one).to_xml
    end
  end

  describe "handling GET /users/new" do

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

    it "should assign the new user for the view" do
      do_get
      assigns[:user].should be_new_record
    end
  end

  describe "handling GET /users/1/edit" do

    def do_get
      get :edit, :id => users(:one).id.to_s
    end

    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end

    it "should assign the found User for the view" do
      do_get
      assigns[:user].should eql(users(:one))

    end
  end

  describe "handling POST /users" do

    describe "with successful save" do

      def do_post
	cnt = User.count
        post :create, :user => {:name => "test5#{cnt}", :login => "test5#{cnt}", :password => "testpw", :email => "user5#{cnt}@test.com"}
      end

      it "should create a new user" do
        lambda {
          do_post
        }.should change(User, :count)
      end

      it "should redirect to the new user" do
        do_post
        response.should redirect_to(user_url(assigns[:user].id))
      end

    end

  end

  describe "handling PUT /users/1" do

    describe "with successful update" do

      def do_put
        put :update, :id => users(:one).id.to_s, :user => {:name => "new_name"}
      end

      it "should update the found user" do
        do_put
        assigns(:user).name.should == "new_name"
      end

      it "should redirect to the user" do
        do_put
        response.should redirect_to(user_url(users(:one).id))
      end

    end
  end

  describe "handling DELETE /users/1" do

    def do_delete
      delete :destroy, :id => users(:two).id.to_s
    end

    it "should remove the user and redirect to the users list" do
      lambda {
        do_delete
      }.should change(User, :count).by(-1)
      response.should redirect_to(users_url)
    end
  end
end
