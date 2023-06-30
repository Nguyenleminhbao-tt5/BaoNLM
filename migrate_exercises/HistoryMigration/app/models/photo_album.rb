class PhotoAlbum < ApplicationRecord
    belongs_to :photo_id
    belongs_to :album_id

end
