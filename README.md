# README

This project contains 2 api's as per the assignment given in the interview, and below is the documentation of both api's:-

## /orders/frequency

- This api returns the consolidated data of number of orders per day per hour starting from the order creation.

- Response is in the following format
  ```
    {
      date: [
        {
          hour: 2023-02-04T18:00:00.000Z,
          count: 72(number of order for that hour)
        }
      ]
    }
  ```

## /repeat_customers

- The logic of repeat customer in last week is assumed as, the customer that have placed order in last week and it's his/her second order

- This api returns the customers that fulfils the above repeat customer criteria.

- Response is in the following format
  ```
    { repeat_customers_data: {
      [
        {
          id: 1(customer_id),
          order_ids: [2,3,4](customer's orders ids)
        }
      ]
    } 
    }
  ```

## Seed data

- There are 5 customers.

- Data is generated in such a way that each customer will have 100 orders where created_at will be 00:30, 01:30, 02:30... and when it reaches 23:30 the next order created at will go to next day.

- Have created more orders for first customer for last day each hour.

- Created one more customer that does not fulfil the condition hence that customer will not appear in repeat_customers api.

