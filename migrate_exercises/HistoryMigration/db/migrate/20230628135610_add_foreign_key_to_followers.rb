class AddForeignKeyToFollowers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :follwers, :users, column: :follwer_id
    add_foreign_key :follwers, :users, column: :following_id
  end
end
