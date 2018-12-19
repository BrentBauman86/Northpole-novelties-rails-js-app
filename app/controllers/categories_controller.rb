class CategoriesController < ApplicationController 

    def index
        @categories = Category.all
    end

    def show 
        @category = Category.find(params[:id])
        @category.toys.build 
    end

    def new
        @category = Category.new 
        @category.toys.build
    end

    def create
        @category = Category.new(category_params) 
        if @category.save 
            redirect_to category_path(@category)
        else
            redirect_to categories_new_path
        end 
    end

    def update 
        category = Category.find(params[:id])
        category.update(category_params)
        redirect_to categories_path 
    end

    private 

    def category_params
        params.require(:category).permit(:name, toys_attributes: [:id, :name, :quantity, :rating])
    end
end