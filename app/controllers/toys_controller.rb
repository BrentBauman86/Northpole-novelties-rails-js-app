class ToysController < ApplicationController 
    before_action :authorize, only: [:edit, :update]

    def index
        @toys = Toy.all
        @category = Category.find(params[:category_id])  
    end

    def new
        @category = Category.find(params[:category_id])
        @toy = @category.toys.build 
    end

    def create
        @category = Category.find(params[:category_id])
        @toy = @category.toys.build(toy_params)
    
        if @toy.save
            redirect_to category_toys_path,  notice: "Thanks for building me"
          else
            redirect_to new_category_toy_path, :notice => "Error, try that again"
          end
      end

    def show 
        @category = Category.find_by(params[:id])
        @toy = Toy.find(toy_params)
    end

    def delete 
        @toy = Toy.find(params[:id])
        @toy.destroy 

        redirect_to categories_path 
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :materials, :quantity, :rating, category_attributes: [:name, :id])
    end 
end
