class CategoriesController < ApplicationController 

    def index
        @categories = Category.all
    end

    def show 
        @category = Category.find(params[:id])
        @user = current_user 
    end 

    def create
        @category = Category.new(category_params) 
        if @category.save 
            redirect_to category_path(@category)
        else
            redirect_to categories_new_path
        end 
    end

    private 

    def category_params
        params.require(:category).permit(:name, toys_attributes: [:id, :name, :quantity, :rating])
    end
end