class RemoveColumnStatusToPhotos < ActiveRecord::Migration[7.0]
  def change
    remove_column :photos, :status
  end
end
