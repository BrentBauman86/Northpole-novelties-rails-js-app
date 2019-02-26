class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.password = SecureRandom.hex
    end
    
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])  
        session[:user_id] = @user.id 
          redirect_to categories_path 
        else
          redirect_to login_path 
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now logged out!"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

