class User < ApplicationRecord
    
    validates :fulname, length: { in: 6..25 }
    validates :age, numericality: true
    validates :type, :sex, presence: true
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, presence: true, uniqueness: true, format: { with: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: 'error format email'}
      


    has_many :albums
    has_many :photos
end
