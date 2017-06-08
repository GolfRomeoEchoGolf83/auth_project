class UsersController < ApplicationController
  def home
  end

  def login
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user
      flash[:info] = "Welcome #{@current_user.name} !"
      redirect_to "/users/home"
    else
      flash[:info] = "Sadly, we don't know you yet..."
      redirect_to "/users/login"
    end
  end
  
end
