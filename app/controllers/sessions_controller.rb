class SessionsController < ApplicationController
  
  def new
    @user = User.new  
  end

  def create
    
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
          redirect_to categories_path, flash.now.alert = "Logged in!"
        else
          flash.now.alert = "Name or password is invalid."
          redirect_to 'sessions/new'
       end
    end
 
    session[:user_id] = @user.id
 
    render 'welcome/home'
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


  private

  def auth
    request.env['omniauth.auth']
  end
end

