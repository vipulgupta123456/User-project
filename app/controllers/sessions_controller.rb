class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
before_filter :save_login_state, :only => [:login, :login_attempt]
  def login

  end
  def login_attempt
    authorized_user = User.authenticate(params[:username],params[:login_password])
	@useraa = authorized_user
	$useraa = @useraa
    if authorized_user
      flash[:notice] = " Hi #{authorized_user.name}"
	  
      render "home",:layout=> "sessions_inside"
       UserMailer.welcome_email(authorized_user).deliver
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"	
    end
  end
  def home
     
  end
  
def edit
end

  def profile
  	  @current_user = User.find session[:user_id] 

  end
  def show
  end
  def setting
  end
  def logout
  session[:user_id] = nil
  redirect_to :action => 'login'
end
end
