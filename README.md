## FoodBringer

A courier service for home-cooked meals. Users can sign in under three different aliases - customer, courier or chef. When logged in a customer, a user can search for chefs in their neighborhood (based on zip code) and place an order. A customer can view the status of their current order - if it has been accepted by the chef, if the food is ready for pick up, if a courier has accepted the delivery and if it's out for delivery. As a chef, a user can accept orders and mark them as ready. Finally as a courier, a user can view outstanding meals that need to be delivered in their delivery zone, accept a delivery and mark a delivery as picked up or delivered. When accepting a delivery, a courier can map the distance between the chef and the customer using the Google Maps API. 

## Built With 

+ Built the front end and back end using Ruby on Rails and the MVC pattern
+ Used Semantic UI to design front end
+ Integrated with Google Maps API to display delivery routes
+ Designed the database schema, including multiple user aliases and configured ActiveRecord associations

## Motivation and Takeaways: ActiveRecord Associations
To explore ActiveRecord associations and database schemas. This project required creating a user model with multiple alias. Each type of user could have many orders, and each order belonged to three different type of users. 

When writing the 'user has_many orders' association in the User model, not only did we need to identify the foreign key listed on the Order model, but also needed to create a different alias for the Order for two of the aliases. 

        has_many :orders, foreign_key: "chef_id" 
        has_many :meals, foreign_key: "customer_id", class_name: "Order"
        has_many :deliveries, foreign_key: "courier_id", class_name: "Order"
        
The 'order belongs_to a user' association in the Order model is below:
        
        belongs_to :chef, class_name: "User"
	      belongs_to :customer, class_name: "User"
	      belongs_to :courier, class_name: "User", optional: true

Creating the database schema in this way helped to advance my understanding of more complex associations and how to apply my existing knowledge of ActiveRecord associations to real world marketplace applications. 

## Contributors

This is a joint project with Neil Steiner - https://github.com/neil176
