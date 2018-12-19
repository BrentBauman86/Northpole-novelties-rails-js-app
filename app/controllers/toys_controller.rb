class ToysController < ApplicationController 
    # before_action :authorize, only: [:edit, :update]
      before_action :current_user, only: [:edit]
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
        @toy =  @category.toys.build(toy_params)
        if @toy.save 
            redirect_to category_path(@category), notice: "Thanks for building me"
          else
            redirect_to new_category_toy_path, notice: "Error, try that again"
          end
      end

    def edit
        @toy = Toy.find_by(params[:id])
    end

    def update 
        @toy = Toy.find_by(params[:id])
        if @category.toys.update(toy_params)
            flash[:success] = "Toy Updated"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end

    def destroy 
        @toy = @category.toys.find_by(params[:id])
        @toy.delete

        redirect_to categories_path 
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :quantity, :rating, categories_attributes: [:id])
    end 

    def find_category
        @category = Category.find_by(id: params[:category_id])
    end
end




