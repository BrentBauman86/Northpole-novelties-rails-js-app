class Toy < ApplicationRecord
    belongs_to :category 
    belongs_to :user 
    scope :toy_name, -> (limit){ order("created_at desc").limit(limit) }

    accepts_nested_attributes_for :category
end
