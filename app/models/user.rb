class User < ApplicationRecord
    has_secure_password
    attr_accessible :name, :password 
    validates_uniqueness_of :name 

end
