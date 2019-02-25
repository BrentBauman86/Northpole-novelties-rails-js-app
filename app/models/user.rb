class User < ActiveRecord::Base
    has_many :toys 
    has_many :categories, through: :toys  

    has_secure_password 
    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 5 }
    
    accepts_nested_attributes_for :toys
end




