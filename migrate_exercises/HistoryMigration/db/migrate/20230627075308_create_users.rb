class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :fullname
      t.decimal :age
      t.string :sex
      t.datetime :DoB

      t.timestamps
    end
  end
end
