class RenameUserAlbumsToUserPhotos < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_albums, :user_photos
  end
end
