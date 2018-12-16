class Subcategory < ApplicationRecord
    belongs_to :category
    belongs_to :toy
    # delegate attributes like so
    delegate: :name, to: :category
end

