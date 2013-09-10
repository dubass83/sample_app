class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #Sign in user and redirec to user's show page
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination" 
      render 'new'
    end
  end

  def destroy
  end

end
