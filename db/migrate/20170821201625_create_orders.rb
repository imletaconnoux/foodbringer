class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :courier_id
      t.integer :chef_id
      t.boolean :accepted, default: false
      t.boolean :ready, default: false
      t.boolean :picked_up, default: false
      t.boolean :completed, default: false


      t.timestamps
    end
  end
end
