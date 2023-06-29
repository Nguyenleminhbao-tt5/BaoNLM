class CreatePhotoAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_albums do |t|

      t.timestamps
    end
  end
end
