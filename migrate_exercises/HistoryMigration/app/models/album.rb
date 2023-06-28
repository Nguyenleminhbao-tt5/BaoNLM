class Album < ApplicationRecord
    validates :title, length: { in: 6..50 }
    validates :description, length: { minimum: 4 }
    validates :status, presence: true

    belongs_to :user
end
