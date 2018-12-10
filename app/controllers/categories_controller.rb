class CategoriesController < ApplicationController 

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new 
    end

    def create
        @category = Category.new(category_params) 
        if @category.save 
            redirect_to categories_path 
        else
            redirect_to categories_new_path
        end 
    end

    private 

    def category_params
        params.require(:category).permit(:name)
    end
end