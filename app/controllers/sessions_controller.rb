class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.autheticate(params[:session][:password])
      #Sign in user and redirec to user's show page
    else
      flash.now[:error] = "Invalid email/password combination" 
      render 'new'
    end
  end

  def destroy
  end

end
