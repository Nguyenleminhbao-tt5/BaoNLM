class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :type , default: 1
      t.string :fullname
      t.integer :age
      t.string :sex  , default: 'female'
      t.datetime :DoB

      t.timestamps
    end
  end
end
