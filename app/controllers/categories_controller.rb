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

    def update 
        category = Category.find(params[:id])
        category.update(category_params)
        redirect_to categories_path 
    end

    def show 
        @category = Category.find(params[:id])
        @category.toys.build 
    end

    private 

    def category_params
        params.require(:category).permit(:name, toys_attributes: [:id, :name, :quantity, :rating])
    end
end