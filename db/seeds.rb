# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

create_customers
create_restaurants
create_orders_for_customers
modify_orders_creation_time
create_data_for_repeat_customer

def create_customers
  10.times { Customer.create!(name: Faker::Name.name) }
end

def create_restaurants
  5.times { Restaurant.create!(name: Faker::Restaurant.name) }
end

def create_orders_for_customers
  Customer.find_each do |customer|
    start_time = Date.today.beginning_of_day - 30.minutes #for every customer order are being created when time is form 01:30, 02:30, 03:30...
    100.times do
      Restaurant.find_each do |restaurant|
        customer.orders.create!(bill_number: Faker::Alphanumeric.alpha(number: 10), created_at: start_time)
        start_time = start_time - 1.hour
      end
    end
  end
end

