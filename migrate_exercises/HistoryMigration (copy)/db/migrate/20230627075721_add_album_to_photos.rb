class AddAlbumToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_reference :photos, :album, null: false, foreign_key: true
  end
end
