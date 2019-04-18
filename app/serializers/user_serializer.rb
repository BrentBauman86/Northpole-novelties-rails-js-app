class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :admin, :uid  

  # has_many :toys
end
