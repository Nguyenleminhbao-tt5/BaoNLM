class Album < ApplicationRecord

    enum mode: { Public: 0, Private: 1}

    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    validates :mode, presence: true

    belongs_to :user
    has_many :photo_albums
    has_many :photos , through: :photo_albums
end
