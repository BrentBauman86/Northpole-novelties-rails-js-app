class ToysController < ApplicationController 
    before_action :authorize, only: [:edit, :update]
    
    def index
        @toys = Toy.all 
    end

    def new
        @category = Category.find(params[:category_id])
        @toy = Toy.new(category: @category)
    end

    def create
        @toy = Toy.new(toy_params)
        @toy.user = current_user
        @toy.category.each { |r| r.user = current_user }
      
        if @toy.save
            redirect_to category_toys_path,  notice: "Thanks for building me"
          else
            redirect_to new_category_toy_path, :notice => "Error, try that again"
          end
      end

    def create 
        @toy = current_user.toys.create(toy_params)
        if @toy.save 
            redirect_to category_toys_path,  notice: "Thanks for building me"
        else
            redirect_to new_category_toy_path
        end  
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :materials, :quantity, :rating)
    end 
end
