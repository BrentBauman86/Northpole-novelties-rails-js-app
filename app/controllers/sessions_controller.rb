class SessionsController < ApplicationController
  
  def new
    @user = User.new  
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
    end
 
    session[:user_id] = @user.id
 
    render 'categories_path'
  end

  # def create
  #   @user = User.find_by_name(params[:name])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to root_url, notice: "Logged in!"
  #   else
  #     flash.now.alert = "Name or password is invalid."
  #   end
  # end

  def destroy 
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end

def auth
  request.env['omniauth.auth']
end
end
