class ToySerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :rating, :user_id, :category_id 

  belongs_to :user
  belongs_to :category
end
