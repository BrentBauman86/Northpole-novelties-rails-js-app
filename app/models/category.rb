class Category < ApplicationRecord
    has_ancestry 
    has_many :toys
    has_many :users, through: :toys 

    accepts_nested_attributes_for :toys 
end

