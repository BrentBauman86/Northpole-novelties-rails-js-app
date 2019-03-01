class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.from_omniauth(auth) if auth
    user = User.find_by(:name => params[:user][:name]) if params[:user]
      if user && user.authenticate(params[:user][:password])
        @user = user
      end
      
    if @user
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

