class ToysController < ApplicationController 
    before_action :authorize, only: [:edit, :update, :create]

    def index
        @toys = Toy.all 
    end

    def new
        @category = Category.find(params[:category_id])
        @toy = Toy.new(category: @category)
    end

    def create 
        @toy = Toy.new(toy_params)
        if @toy.save 
            redirect_to category_toys_path,  notice: "Thanks for building me dick"
        else
            redirect_to new_category_toy_path
        end  
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :materials, :quantity, :rating)
    end 
end
