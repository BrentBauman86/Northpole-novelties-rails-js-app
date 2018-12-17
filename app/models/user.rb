class User < ActiveRecord::Base
    has_secure_password 
    validates :name, presence: true, uniqueness: true 
    validates :password, presence: true, length: { minimum: 5 } 

    has_many :categoies, through: :toys 
    has_many :toys 

    accepts_nested_attributes_for :toys
end 
