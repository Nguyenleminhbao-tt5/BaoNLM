class AddListLikeToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :list_like, :integer, array: true ,default: []
  end
end
