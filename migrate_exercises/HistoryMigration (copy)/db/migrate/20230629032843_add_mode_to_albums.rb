class AddModeToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :mode, :integer, default: 0
  end
end
