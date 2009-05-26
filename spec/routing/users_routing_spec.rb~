require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do

  describe "route generation" do
    it "should map { :controller => 'users', :action => 'index' } to /usuarios" do
      route_for(:controller => "users", :action => "index").should == "/usuarios"
    end
  
    it "should map { :controller => 'users', :action => 'new' } to /usuarios/novo" do
      route_for(:controller => "users", :action => "new").should == "/usuarios/novo"
    end
  
    it "should map { :controller => 'users', :action => 'show', :id => 1 } to /usuarios/1" do
      route_for(:controller => "users", :action => "show", :id => "1").should == "/usuarios/1"
    end
  
    it "should map { :controller => 'users', :action => 'edit', :id => 1 } to /usuarios/1/ver" do
      route_for(:controller => "users", :action => "edit", :id => "1").should == "/usuarios/1/ver"
    end

    it "should map { :controller => 'users', :action => 'update', :id => 1 } to /usuarios/1" do
		  route_for(:controller => "users", :action => "udpate", :id => 1).should == "/usuarios/1"
		end

    it "should map { :controller => 'users', :action => 'destroy', :id => 1 } to /usuarios/1" do
		  route_for(:controller => "users", :action => "destroy", :id => 1).should == "/usuarios/1"
		end
  end

  describe "route recognition" do
    it "generates params { :controller => 'users', :action => 'index' } from GET /usuarios" do
      params_from(:get, "/usuarios").should == {:controller => "users", :action => "index"}
    end
  
    it "generates params { :controller => 'users', :action => 'new' } from GET /usuarios/novo" do
      params_from(:get, "/usuarios/novo").should == {:controller => "users", :action => "new"}
    end
  
    it "generates params { :controller => 'users', :action => 'create' } from PUT /usuarios" do
      params_from(:post, "/usuarios").should == {:controller => "users", :action => "create"}
    end
  
    it "generates params { :controller => 'users', :action => 'show', :id => 1 } from GET /usuarios/1" do
      params_from(:get, "/users/1").should == {:controller => "users", :action => "show", :id => "1"}
    end
  
    it "generates params { :controller => 'users', :action => 'edit', :id => 1 } from GET /usuarios/1/ver" do
      params_from(:get, "/usuarios/1/ver").should == {:controller => "users", :action => "edit", :id => "1"}
    end
  
    it "generates params { :controller => 'users', :action => 'update', :id => 1 } from PUT /usuarios/1" do
      params_from(:put, "/usuarios/1").should == {:controller => "users", :action => "update", :id => "1"}
    end
  
    it "generates params { :controller => 'users', :action => 'update', :id => 1 } from DELETE /usuarios/1" do
      params_from(:delete, "/usuarios/1").should == {:controller => "users", :action => "destroy", :id => "1"}
    end
  end
end
