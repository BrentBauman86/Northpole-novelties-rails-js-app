class Toy < ActiveRecord::Base 
    belongs_to :category 
    belongs_to :user 
    scope :rating, -> { where('rating < 7') }

    accepts_nested_attributes_for :category
end

