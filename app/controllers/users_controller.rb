class UsersController < ApplicationController
  def index
    if !@current_user || @current_user.role != "admin"
      return head :forbidden
    end
    
  end
  
  def home
  end

  def login
  end

  def check
    @current_user = User.where(name: params[:name], password: params[:password]).first
    if @current_user 
      session[:user_id] = @current_user.id
      flash[:info] = "Welcome #{@current_user.name} !"
      redirect_to "/users/home"
    else
      session[:user_id] = nil
      flash[:info] = "Sadly, we don't know you yet..."
      redirect_to "/users/login"
    end
  end
  
end
