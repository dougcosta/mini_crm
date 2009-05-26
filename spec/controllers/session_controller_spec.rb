require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SessionController do
	fixtures :users

	describe "User login and session management" do
		it "should redirecct to the logon form fi the user does not exists" do
			post :create, :username => "test", :password => "test"
			response.should redirect_to(new_session_path)
			session[:user].should be_nil
		end
		it "should redirect to the home of the application if logon succeds" do
			post :create, :username => "userone", :password => "test"
			response.should redirect_to(root_path)
			session[:user].should_not be_nil
		end
	
		it "should redirect to the logon form when the user finish the session" do
			delete :destroy
			response.should redirect_to(new_session_path)
			session[:user].should be_nil
		end
	end
	
end
