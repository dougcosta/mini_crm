require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CompaniesController do
  describe "direct company access" do
    describe "route generation" do

      it "should map { :controller => 'companies', :action => 'index' } to /empresas" do
	route_for(:controller => "companies", :action => "index").should == "/empresas"
      end

      it "should map { :controller => 'companies', :action => 'new' } to /empresas/nova" do
	route_for(:controller => "companies", :action => "new").should == "/empresas/nova"
      end

      it "should map { :controller => 'companies', :action => 'show', :id => 1 } to /empresas/1" do
	route_for(:controller => "companies", :action => "show", :id => 1).should == "/empresas/1"
      end

      it "should map { :controller => 'companies', :action => 'edit', :id => 1 } to /empresas/1/ver" do
	route_for(:controller => "companies", :action => "edit", :id => 1).should == "/empresas/1/ver"
      end

      it "should map { :controller => 'companies', :action => 'update', :id => 1} to /empresas/1" do
	route_for(:controller => "companies", :action => "update", :id => 1).should == "/empresas/1"
      end

      it "should map { :controller => 'companies', :action => 'destroy', :id => 1} to /empresas/1" do
	route_for(:controller => "companies", :action => "destroy", :id => 1).should == "/empresas/1"
      end
    end

    describe "route recognition" do

      it "should generate params { :controller => 'companies', action => 'index' } from GET /empresas" do
	params_from(:get, "/empresas").should == {:controller => "companies", :action => "index"}
      end

      it "should generate params { :controller => 'companies', action => 'new' } from GET /empresas/nova" do
	params_from(:get, "/empresas/nova").should == {:controller => "companies", :action => "new"}
      end

      it "should generate params { :controller => 'companies', action => 'create' } from POST /empresas" do
	params_from(:post, "/empresas").should == {:controller => "companies", :action => "create"}
      end

      it "should generate params { :controller => 'companies', action => 'show', id => '1' } from GET /empresas/1" do
	params_from(:get, "/empresas/1").should == {:controller => "companies", :action => "show", :id => "1"}
      end

      it "should generate params { :controller => 'companies', action => 'edit', id => '1' } from GET /empresas/1;edit" do
	params_from(:get, "/empresas/1/ver").should == {:controller => "companies", :action => "edit", :id => "1"}
      end

      it "should generate params { :controller => 'companies', action => 'update', id => '1' } from PUT /empresas/1" do
	params_from(:put, "/empresas/1").should == {:controller => "companies", :action => "update", :id => "1"}
      end

      it "should generate params { :controller => 'companies', action => 'destroy', id => '1' } from DELETE /empresas/1" do
	params_from(:delete, "/empresas/1").should == {:controller => "companies", :action => "destroy", :id => "1"}
      end
    end
  end
  describe "acessing user companies" do
    describe "route generation" do

      it "should map { :controller => 'companies', :action => 'index', :user_id => '1' } to /usuarios/1/empresas" do
	route_for(:controller => "companies", :action => "index", :user_id => '1').should == "/usuarios/1/empresas"
      end

      it "should map { :controller => 'companies', :action => 'new', :user_id => '1' } to /usuarios/1/empresas/nova" do
	route_for(:controller => "companies", :action => "new", :user_id => '1').should == "/usuarios/1/empresas/nova"
      end

      it "should map { :controller => 'companies', :action => 'show', :id => 1, :user_id => '1' } to /usuarios/1/empresas/1" do
	route_for(:controller => "companies", :action => "show", :id => 1, :user_id => '1').should == "/usuarios/1/empresas/1"
      end

      it "should map { :controller => 'companies', :action => 'edit', :id => 1, :user_id => '1' } to /usuarios/1/empresas/1/ver" do
	route_for(:controller => "companies", :action => "edit", :id => 1, :user_id => '1').should == "/usuarios/1/empresas/1/ver"
      end

      it "should map { :controller => 'companies', :action => 'update', :id => 1, :user_id => '1'} to /usuarios/1/empresas/1" do
	route_for(:controller => "companies", :action => "update", :id => 1, :user_id => '1').should == "/usuarios/1/empresas/1"
      end

      it "should map { :controller => 'companies', :action => 'destroy', :id => 1, :user_id => '1'} to /usuarios/1/empresas/1" do
	route_for(:controller => "companies", :action => "destroy", :id => 1, :user_id => '1').should == "/usuarios/1/empresas/1"
      end
    end

    describe "route recognition" do

      it "should generate params { :controller => 'companies', action => 'index', :user_id => '1' } from GET /usuarios/1/empresas" do
	params_from(:get, "/usuarios/1/empresas").should == {:controller => "companies", :action => "index", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'new', :user_id => '1' } from GET /usuarios/1/empresas/nova" do
	params_from(:get, "/usuarios/1/empresas/nova").should == {:controller => "companies", :action => "new", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'create', :user_id => '1' } from POST /usuarios/1/empresas" do
	params_from(:post, "/usuarios/1/empresas").should == {:controller => "companies", :action => "create", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'show', id => '1', :user_id => '1' } from GET /usuarios/1/empresas/1" do
	params_from(:get, "/usuarios/1/empresas/1").should == {:controller => "companies", :action => "show", :id => "1", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'edit', id => '1', :user_id => '1' } from GET /usuarios/1/empresas/1;edit" do
	params_from(:get, "/usuarios/1/empresas/1/ver").should == {:controller => "companies", :action => "edit", :id => "1", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'update', id => '1', :user_id => '1' } from PUT /usuarios/1/empresas/1" do
	params_from(:put, "/usuarios/1/empresas/1").should == {:controller => "companies", :action => "update", :id => "1", :user_id => '1'}
      end

      it "should generate params { :controller => 'companies', action => 'destroy', id => '1', :user_id => '1' } from DELETE /usuarios/1/empresas/1" do
	params_from(:delete, "/usuarios/1/empresas/1").should == {:controller => "companies", :action => "destroy", :id => "1", :user_id => '1'}
      end
    end
  end
end
