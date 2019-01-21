class ToysController < ApplicationController 
      before_action :current_user 
      before_action :find_category

    def index
        @toys = Toy.all
    end

    def show 
        @toy = Toy.find_by(params[:id])
    end

    def new
        @toy = Toy.new
    end

    def create 
        raise 
        @toy = @category.toys.build(toy_params)
        if @toy.save
            redirect_to category_path(@category), notice: "Thanks for building me"
        else
            render 'new_category_toy_path'
        end
    end

    def edit 
        @toy = Toy.find_by(id: params[:id])
    end

    def update 
        @toy = Toy.find_by(id: params[:id])
        if @toy.update(toy_params) 

            redirect_to category_path(@category), notice: "Toy Updated"
        else
            redirect_to edit_category_toy, notice: "Rating must be between 1-10"
        end 
    end
    
    def destroy 
        @toy = Toy.find_by(id: params[:id])
        @toy.delete

        if current_user.admin 
            redirect_to category_path(@category), notice: 'Santa just brought some Christmas cheer to a young one!'
        else 
            redirect_to category_path(@category), notice: 'Toy has been destroyed'
    end
end 

    private 

    def toy_params
        params.require(:toy).permit(:name, :quantity, :rating, categories_attributes: [:id])
    end 

    def find_category
        @category = Category.find_by(id: params[:category_id])
    end
end 




