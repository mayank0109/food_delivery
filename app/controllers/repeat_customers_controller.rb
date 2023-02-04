
class RepeatCustomersController < ApplicationController

  def index
    # Logic to find repeat customers for past week(Current date - 7 days) is as follows :-
    # - The customer has orderd more than 1 time and has ordered at least 1 time in past week.
    time_range = (1.week.ago.beginning_of_day)..(Date.today.beginning_of_day)
    repeat_customers_data = Customer.joins(:orders).group("customers.id").
                              select("customers.id", "array_agg(orders.id) as order_ids").
                              where(orders: {created_at: time_range}).
                              having("array_length(array_agg(orders.id),1) > 1")
  
    # The response will be of form { id: (customer_id that satifies repeat condition), order_ids: (orders by customer in time range) }
    render json: { repeat_customers_data: repeat_customers_data }, status: :ok
  end
end
