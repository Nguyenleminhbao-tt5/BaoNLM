class AddUserToUserAlbums < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_albums, :user, null: false, foreign_key: true
  end
end
