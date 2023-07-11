class AddModeToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :mode, :integer, default: 0
  end
end
