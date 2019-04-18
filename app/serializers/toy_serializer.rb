class ToySerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :rating 

  belongs_to :user
  belongs_to :category
end
