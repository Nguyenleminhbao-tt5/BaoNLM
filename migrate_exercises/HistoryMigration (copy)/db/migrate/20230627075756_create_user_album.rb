class CreateUserAlbum < ActiveRecord::Migration[7.0]
  def change
    create_table :user_albums do |t|

      t.timestamps
    end
  end
end
