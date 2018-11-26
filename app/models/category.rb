class Category < ApplicationRecord
    has_many :toys
    has_many :users, though: :toys 
end

