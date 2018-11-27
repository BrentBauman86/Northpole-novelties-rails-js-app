class Category < ApplicationRecord
    has_many :toys
    has_many :users, through: :toys 
end

