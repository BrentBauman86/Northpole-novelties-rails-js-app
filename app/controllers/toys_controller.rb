class ToysController < ApplicationController 
      before_action :find_category

    def index
       if @category 
            @toys = @category.toys
        else 
           @toys = Toy.all 
        end

        response_to do |f|
            f.html {render :index}
            f.json {render json: @toys}
        end
    end 

    def show 
        @toy = @category.toys.find_by(id: params[:id])
    end
    
    def new
        @toy = Toy.new
    end

    def create 
        @toy = @category.toys.build(toy_params)
        @toy.user_id = current_user.id 
        if @toy.save
            redirect_to category_path(@category), notice: "Thanks for building me"
        else
            render 'new'
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
            render 'edit'
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
        params.require(:toy).permit(:name, :quantity, :rating, users_attributes: [:id], categories_attributes: [:id])
    end 

    def find_category
        @category = Category.find_by(id: params[:category_id])
    end
end 




