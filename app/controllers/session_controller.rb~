class SessionController < ApplicationController
  def new
  	session[:user] => nil
  end
  
  def create
  	@user = User.logon(params[:username], params[:password])
  	if @user.nil?
  		redirect_to :action => :new
  	else
  		User.current_user = @user
  		session[:user] = @user
  		redirect_to root_path
  	end
  end
  
  def destroy
  	session[:user] = nil
  	redirect_to :action => :new
  end
end
