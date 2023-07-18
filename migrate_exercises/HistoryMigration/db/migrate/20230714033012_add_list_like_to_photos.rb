class AddListLikeToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :list_like, :integer ,array: true, default: []
  end
end
