class Orders::FrequencyController < ApplicationController

  def index
    frequency_data = Hour.left_joins_orders. 
                      # hour series is generated for last 3 years but below statement will filter out the hour series
                      # before the first order was created.
                      where("orders.created_at >= (select created_at from orders order by created_at limit 1)"). # hour series is generate for last 3 years but this 
                      select_hour_and_order_count.
                      group_by_hour.
                      order("hour desc").
                      group_by { |record| record[:hour].to_date }

    render json: { frequency_data: frequency_data }, status: :ok
  end
end
