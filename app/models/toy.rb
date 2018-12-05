class Toy < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
    scope :toy_name, -> (name){ where(toy_name: name)}

    accepts_nested_attributes_for :category
end
