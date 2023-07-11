class AddPhotoToPhotoAlbums < ActiveRecord::Migration[7.0]
  def change
    add_reference :photo_albums, :photo, null: false, foreign_key: true
  end
end
