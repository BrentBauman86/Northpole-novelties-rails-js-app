class ToysController < ApplicationController 
    # before_action :authorize, only: [:edit, :update]
      before_action :current_user, only: [:create] 
      before_action :find_category, except: [:edit, :update]

    def index
        @toys = Toy.all
    end

    def new
        @toy = @category.toys.build 
    end

    def create
        @category = Category.find(params[:id])
        @toy = @category.toys.build
        
        if @toy.save 
            redirect_to category_path(@category), notice: "Thanks for building me"
          else
            redirect_to new_category_toy_path, notice: "Error, try that again"
          end
      end

    def show 
        @toy = Toy.find_by(params[:id])
    end

    def edit
        @toy = Toy.find_by(params[:id])
    end

    def update 
        @toy = Toy.find(params[:id])
        if @toy.update?
            flash[:success] = "Toy Updated"
            redirect_to category_toys_path
        else
            render 'edit'
        end
    end

    def delete 
        @toy = Toy.find(params[:id])
        @toy.destroy 

        redirect_to categories_path 
    end

    private 

    def toy_params
        params.require(:toy).permit(:name, :materials, :quantity, :rating)
    end 

    def find_category
        @category = Category.find(params[:category_id])
    end
end




