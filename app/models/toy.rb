class Toy < ActiveRecord::Base 
    has_and_belongs_to_many :categories 
    belongs_to :user, optional: true 
    validates :name, :rating, :quantity, presence: true 
    scope :high_rating, -> { where('rating > 7') }

    accepts_nested_attributes_for :categories, allow_destroy: true
end

