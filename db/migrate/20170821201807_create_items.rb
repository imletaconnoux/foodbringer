class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :chef_id
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
