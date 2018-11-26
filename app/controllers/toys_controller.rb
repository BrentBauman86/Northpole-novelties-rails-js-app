class ToysController < ApplicationController 
    before_filter :authorize, only: [:edit, :update]

    def index
        @toys = Toy.all 
    end

    def new
        @toy = Toy.new 

    end

    def create 
    end

end