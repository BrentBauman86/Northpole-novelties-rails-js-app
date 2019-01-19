class UsersController < ApplicationController
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id 
        redirect_to categories_path, notice: "Welcome to NorthPole Novelties!"
      else
        redirect_to "new_session_path"
      end
    end

    def validate
      user = User.new(validate_params)
      user.valid?
      user_field = validate_params.keys.first.try(:to_sym)
      validation_response = !user.errors.include?(event_field)
      respond_to do |format|
        format.json { render json: {field_name: user_field, valid: validation_response, message: user.errors[user_field]} }
      end
    end
    private 

      def user_params
        params.require(:user).permit(:name, :password, :admin)
      end

      def validate_params
        params.permit(:name, :password)
      end
    end
    

