class Photo < ApplicationRecord

    enum mode: { Public: 0, Private: 1}

    validates :title, length: { maximum: 140 }
    validates :description, length: { maximum: 300 }
    validates :mode, :source,  presence: true


    belongs_to :user
    has_many :photo_albums
    has_many :albums, through: :photo_albums
end
