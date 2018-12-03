class Toy < ApplicationRecord
    belongs_to :category 
    belongs_to :user 

    accepts_nested_attributes_for :category
end
