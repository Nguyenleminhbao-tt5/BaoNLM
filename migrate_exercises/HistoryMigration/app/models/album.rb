class Album < ApplicationRecord

    enum mode: { public: 0, priate: 1}

    validates :title, length: { in: 6..50 }
    validates :description, length: { minimum: 4 }
    validates :status, presence: true

    belongs_to :user
    has_many :photo_albums
    has_many :photos , through :photo_albums
end
