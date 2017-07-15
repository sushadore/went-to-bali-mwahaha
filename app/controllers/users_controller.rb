class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "You're account was created!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
