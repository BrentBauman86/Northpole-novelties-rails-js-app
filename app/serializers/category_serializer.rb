class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :toys
end
