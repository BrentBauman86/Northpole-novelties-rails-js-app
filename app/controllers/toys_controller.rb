class ToysController < ApplicationController 

    def index
        @toys = Toy.all 
    end

    def new
        @toy = Toy.new 

    end

    def create 
    end

end