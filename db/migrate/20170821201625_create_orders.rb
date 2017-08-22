class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :courier_id
      t.integer :chef_id
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
