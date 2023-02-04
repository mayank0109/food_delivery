class AddReferencesInOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :restaurant, index: true
  end
end
