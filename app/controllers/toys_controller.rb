class ToysController < ApplicationController 
      before_action :find_category

    def index
       if @category 
            @toys = @category.toys
        else 
           @toys = Toy.all 
        end

        respond_to do |f|
            f.html {render :index}
            f.json {render json: @toys}
        end
    end 

    def show 
        @toy = @category.toys.find_by(id: params[:id])
        
        respond_to do |f|
            f.html {render :show}
            f.json {render json: @toy}
        end
    end
    
    def new
        @toy = Toy.new

        respond_to do |f|
            f.html {render :new}
            f.json {render json: @toy}
        end 
    end

    def create 
        @toy = @category.toys.build(toy_params)
        @toy.user_id = current_user.id 
        respond_to do |format|
        if @toy.save
            format.html {redirect_to category_path(@category), notice: "Thanks for building me"}
            format.json {render json: @toy}
        else
            format.html {render :new}
            format.json {render json: @toy.errors, status: :unprocessable_entity}
            end
        end
    end

    def edit 
        @toy = Toy.find_by(id: params[:id])

        respond_to do |f|
            f.html {render :edit}
            f.json {render json: @toy}
        end
    end

    def update 
        @toy = Toy.find_by(id: params[:id])
        if @toy.update(toy_params) 
            redirect_to category_path(@category), notice: "Toy Updated"
        else
            render 'edit'
        end 

        respond_to do |f|
            f.html {render :update}
            f.json {render json: @toy}
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
    
    respond_to do |f|
        f.html {render :index}
        f.json {render json: @toy}
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




