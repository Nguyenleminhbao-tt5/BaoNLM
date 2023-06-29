class RemoveColumnStatusToAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :status
  end
end
