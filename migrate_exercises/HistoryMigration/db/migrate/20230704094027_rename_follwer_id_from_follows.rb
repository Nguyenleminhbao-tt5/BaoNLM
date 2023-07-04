class RenameFollwerIdFromFollows < ActiveRecord::Migration[7.0]
  def change
    rename_column :follows, :follwer_id, :follower_id
  end
end
