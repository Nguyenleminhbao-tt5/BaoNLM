class AddListImageToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :list_image, :string
  end
end
