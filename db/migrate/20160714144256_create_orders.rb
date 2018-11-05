class CreateOrders < ActiveRecord::Migration[5.0]
  def up
    create_table :order_statuses do |t|
      t.string :name

      t.timestamps
    end

    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :charge, precision: 12, scale: 3
      t.decimal :total_amount, precision: 12, scale: 3
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :orders
    drop_table :order_statuses
  end
end
