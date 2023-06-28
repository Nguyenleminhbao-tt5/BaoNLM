class AddManageIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :manage_id, :integer
    add_foreign_key :users, :users, column: :manage_id
  end

  
end
