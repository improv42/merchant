class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ship_name
      t.text :ship_address
      t.string :payment_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
