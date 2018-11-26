class Toy < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
end
