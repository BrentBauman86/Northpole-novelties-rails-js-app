class Toy < ActiveRecord::Base 
    belongs_to :category 
    belongs_to :user 
    scope :toy_id, -> (id) { where.('id = ?', id) if id.present? }

    accepts_nested_attributes_for :category
end
