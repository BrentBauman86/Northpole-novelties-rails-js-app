class User < ActiveRecord::Base
    has_many :toys 
    has_many :categories, through: :toys  

    has_secure_password 
    validates_uniqueness_of :name, presence: true
    validates :password, presence: true, length: { minimum: 5 }
    
    accepts_nested_attributes_for :toys

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_create(name: auth.info.name, password: auth.uid)
    end
end




