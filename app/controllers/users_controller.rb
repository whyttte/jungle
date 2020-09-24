class UsersController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
    puts '.....................................', params, user 
    if !user
      user = User.new(user_params)
    
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    else
      redirect_to '/login'
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end