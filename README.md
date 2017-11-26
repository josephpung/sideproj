# Take Home Assignment

## Usage Instructions
#### 1) Run the following commands to create the database, seed the data then start the server.
```sh
bundle

rails db:migrate
rails db:seed

rails s
```
#### 2) View default endpoints

###### Available paths:
* localhost:3000/orders
* localhost:3000/orders/:order_id

#### 3) Testing

* rspec spec/models/order_item_spec.rb
* rspec spec/models/meal_spec.rb
* rspec spec/models/delivery_order_spec.rb

or

* bundle exec rspec spec (runs all tests)

### Link to original question details

[Ordiez](https://gist.github.com/primaulia/a314fb45ebf486215ece639b9b818ac4)
