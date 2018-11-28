class User < ActiveRecord::Base
    has_secure_password 
    validates_presence_of :name, :password
    validates_length_of :password, in: 5..30
   
    has_many :categoies, through: :toys 
    has_many :toys 

end 
