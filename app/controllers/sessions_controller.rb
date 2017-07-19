class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "You're signed in."
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing in. Do you have an account? Are your email and password correct?"
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out."
    redirect_to '/'
  end
end
