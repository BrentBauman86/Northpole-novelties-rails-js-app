class User < ActiveRecord::Base
   has_secure_password 
   has_many :categoies, through: :toys 
   has_many :toys 
   
   validates_uniqueness_of :name

end 
