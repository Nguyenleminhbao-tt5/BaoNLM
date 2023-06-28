class Photo < ApplicationRecord
    validates :title, length: { in: 6..50 }
    validates :description, length: { minimum: 4 }
    validates :status, :source,  presence: true


    has_many :users
end
