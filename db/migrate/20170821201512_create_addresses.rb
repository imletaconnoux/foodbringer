class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :label
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
