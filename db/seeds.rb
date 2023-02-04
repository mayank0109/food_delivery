# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def create_customers
  10.times { Customer.create!(name: Faker::Name.name) }
end

def create_orders_for_customers
  Customer.find_each do |customer|
    start_time = Date.today.beginning_of_day - 30.minutes #for every customer order are being created when time is form 01:30, 02:30, 03:30...
    100.times do
      customer.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time)
      start_time = start_time - 1.hour
    end
  end
end

def create_data_for_non_repeat_customer
  start_time = Date.today.beginning_of_day - 2.hours
  # this customer will only have one order created in last week time frame, it will not fulfil the condition to be a repeat customer
  # hence this customer should not appear in /repeat_customers api.
  customer1 = Customer.create!(name: Faker::Name.name)
  customer1.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time)

  # this customer have 2 olders but none of the orders are created in last week, so this customer should also not appear in /repeat_customers api
  customer2 = Customer.create!(name: Faker::Name.name)
  customer1.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time - 2.weeks.ago)
  customer1.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time - 3.weeks.ago)
end

def create_more_order_for_previous_day
  customer = Customer.first
  start_time = (Date.today - 1).beginning_of_day
  24.times do
    customer.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time)
    start_time += 1.hour
  end
end

create_customers
create_orders_for_customers
create_data_for_non_repeat_customer
create_more_order_for_previous_day
