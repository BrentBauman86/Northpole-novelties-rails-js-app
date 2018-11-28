class User < ActiveRecord::Base
    has_secure_password 
    validates_presence_of :name, :password
    validates_length_of :password, minimum: 6
    validates_inclusion_of :admin, in: [true, false]

    has_many :categoies, through: :toys 
    has_many :toys 
end 
