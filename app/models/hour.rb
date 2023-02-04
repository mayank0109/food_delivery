class Hour < ApplicationRecord
  self.primary_key = :hour

  scope :left_joins_orders, -> { joins("left join orders on date_trunc('hour', orders.created_at) = hours.hour") }
  scope :select_hour_and_order_count, -> { select("date_trunc('hour', hours.hour)", "count(orders.id)") }
  scope :group_by_hour, -> { group("hours.hour") }
  
  def readonly?
    true
  end
end