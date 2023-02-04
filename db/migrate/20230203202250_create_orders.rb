class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.bigint :order_id
      t.string :bill_number
      t.references :customer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
