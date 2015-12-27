class UsersController < ApplicationController
 before_filter :save_login_state, :only => [:new, :create]
  def new
  	 @user = User.new 
  end
  def create
    @user = User.new(user_params)
    if @user.save
    	puts "abc"
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
       UserMailer.welcome_email(@user).deliver
	   redirect_to :controller => "sessions", :action => "login"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
        render "new"
    
end
	end
     private
   def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end
