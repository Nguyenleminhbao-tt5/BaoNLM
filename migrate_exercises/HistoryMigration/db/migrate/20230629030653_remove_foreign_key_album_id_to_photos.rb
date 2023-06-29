class RemoveForeignKeyAlbumIdToPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :photos, :albums
   
  end
end
