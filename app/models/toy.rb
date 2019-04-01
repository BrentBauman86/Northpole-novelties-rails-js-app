class Toy < ActiveRecord::Base 
    belongs_to :category 
    belongs_to :user
    validates :name, presence: true 
    validates :quantity, numericality: { only_integer: true }
    validates :rating, numericality: { less_than_or_equal_to: 10 } 
    
    scope :popular, -> { where('rating > 7') }

    # def self.popular
    #     where('rating > 7')
    # end
    
end

