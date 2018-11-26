class User < ActiveRecord::Base
   has_many :categoies, through: :toys 
   has_many :toys 
end
