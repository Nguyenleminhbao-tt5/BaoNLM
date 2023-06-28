class CreateFollwer < ActiveRecord::Migration[7.0]
  def change
    create_table :follwers do |t|
      t.integer :follwer_id
      t.integer :be_follower_id

      t.timestamps
    end
  end

end
