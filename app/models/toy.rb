class Toy < ActiveRecord::Base 
    belongs_to :categories 
    belongs_to :user, optional: true 
    validates :name, presence: true 
    validates :quantity, numericality: { only_integer: true }
    validates :rating, numericality: { less_than_or_equal_to: 10 } 
    
    scope :high_rating, -> { where('rating > 7') }

    accepts_nested_attributes_for :categories, allow_destroy: true
end

