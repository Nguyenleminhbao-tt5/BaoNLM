class CreateUserPhoto < ActiveRecord::Migration[7.0]
  def change
    create_table :user_photos do |t|

      t.timestamps
    end
  end
end
