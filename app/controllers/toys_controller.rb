class ToysController < ApplicationController 
    before_action :authorize, only: [:edit, :update, :create]

    def index
        @toys = Toy.all 
    end

    def new
        @toy = Toy.new 
    end

    def create 
        @toy = Toy.new(toy_params)
        if @toy.save 
            redirect_to category_toys_path 
        else
            render "new"
        end  
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :materials, :quantity, :rating)
    end 
end
