class Photo < ApplicationRecord
    validates :title, length: { in: 6..50 }
    validates :description, length: { minimum: 4 }
    validates :status, :source,  presence: true


    belongs_to :users
end
