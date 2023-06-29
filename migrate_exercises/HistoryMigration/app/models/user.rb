class User < ApplicationRecord
    
    validates :fulname, length: { in: 6..25 }
    validates :age, numericality: true
    validates :type, :sex, presence: true


    has_many :albums
    has_many :photos
end
