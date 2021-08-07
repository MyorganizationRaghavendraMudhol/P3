2.1.1 find
Using the find method, you can retrieve the object corresponding to the specified primary key that matches any supplied options. For example:

# Find the customer with primary key (id) 10.
irb> customer = Customer.find(10)
=> #<Customer id: 10, first_name: "Ryan">
customer = Customer.find(10)

Copy
The SQL equivalent of the above is:

SELECT * FROM customers WHERE (customers.id = 10) LIMIT 1

Example:-
2.6.8 :006 > User.find(1);
  User Load (0.3ms)  SELECT `users`.* FROM `users` WHERE `users`.`id` = 1 LIMIT 1
 => #<User id: 1, name: "Raghavendra Mudhol", location: "Bangalore", sem: 5, created_at: "2021-08-07 13:09:22.855963000 +0000", updated_at: "2021-08-07 13:09:22.855963000 +0000"> 



2.1.2 take
The take method retrieves a record without any implicit ordering. For example:

irb> customer = Customer.take
=> #<Customer id: 1, first_name: "Lifo">
customer = Customer.take

Copy
The SQL equivalent of the above is:

SELECT * FROM customers LIMIT 1

Example:-

2.6.8 :005 > Course.take
  Course Load (0.5ms)  SELECT `courses`.* FROM `courses` LIMIT 1
 => #<Course id: 1, name: "Java", credit: 5, created_at: "2021-08-07 13:12:14.742145000 +0000", updated_at: "2021-08-07 13:12:14.742145000 +0000", user_id: 1>


 2.1.3 first
The first method finds the first record ordered by primary key (default). For example:

irb> customer = Customer.first
=> #<Customer id: 1, first_name: "Lifo">
customer = Customer.first

Copy
The SQL equivalent of the above is:

SELECT * FROM customers ORDER BY customers.id ASC LIMIT 1

Example:-

  User Load (0.4ms)  SELECT `users`.* FROM `users` ORDER BY `users`.`id` ASC LIMIT 3
 => [#<User id: 1, name: "Raghavendra Mudhol", location: "Bangalore", sem: 5, created_at: "2021-08-07 13:09:22.855963000 +0000", updated_at: "2021-08-07 13:09:22.855963000 +0000">, #<User id: 2, name: "Mudhol", location: "Bangalore", sem: 4, created_at: "2021-08-07 13:09:34.671943000 +0000", updated_at: "2021-08-07 13:09:34.671943000 +0000">, #<User id: 3, name: "Jk", location: "Hubli", sem: 4, created_at: "2021-08-07 13:09:48.447129000 +0000", updated_at: "2021-08-07 13:09:48.447129000 +0000">] 

 2.1.5 find_by
The find_by method finds the first record matching some conditions. For example:

irb> Customer.find_by first_name: 'Lifo'
=> #<Customer id: 1, first_name: "Lifo">

irb> Customer.find_by first_name: 'Jon'
=> nil
Customer.find_by first_name: 'Lifo'
Customer.find_by first_name: 'Jon'

Copy
It is equivalent to writing:

Customer.where(first_name: 'Lifo').take
Customer.where(first_name: 'Lifo').take

Copy
The SQL equivalent of the above is:

SELECT * FROM customers WHERE (customers.first_name = 'Lifo') LIMIT 


Example:-

2.6.8 :016 > User.find_by name: "Raghavendra Mudhol";
  User Load (0.4ms)  SELECT `users`.* FROM `users` WHERE `users`.`name` = 'Raghavendra Mudhol' LIMIT 1
 => #<User id: 1, name: "Raghavendra Mudhol", location: "Bangalore", sem: 5, created_at: "2021-08-07 13:09:22.855963000 +0000", updated_at: "2021-08-07 13:09:22.855963000 +0000"> 

 2.2 Retrieving Multiple Objects in Batches
We often need to iterate over a large set of records, as when we send a newsletter to a large set of customers, or when we export data.

This may appear straightforward:

# This may consume too much memory if the table is big.
Customer.all.each do |customer|
  NewsMailer.weekly(customer).deliver_now
end

Example:-

2.6.8 :017 > Course.all.each do |a|
2.6.8 :018 >     p a
2.6.8 :019?>   end

2.6.8 :020 > User.all.each do |a|
2.6.8 :021 >     p a
2.6.8 :022?>   end


3 Conditions
The where method allows you to specify conditions to limit the records returned, representing the WHERE-part of the SQL statement. Conditions can either be specified as a string, array, or hash.

Example:-

2.6.8 :024 > User.where(id:1);
  User Load (0.4ms)  SELECT `users`.* FROM `users` WHERE `users`.`id` = 1 /* loading for inspect */ LIMIT 11
 => #<ActiveRecord::Relation [#<User id: 1, name: "Raghavendra Mudhol", location: "Bangalore", sem: 5, created_at: "2021-08-07 13:09:22.855963000 +0000", updated_at: "2021-08-07 13:09:22.855963000 +0000">]> 

 3.4 NOT Conditions
NOT SQL queries can be built by where.not:

Customer.where.not(orders_count: [1,3,5]

Examples:-
2.6.8 :025 > User.where.not(id:1);
  User Load (0.7ms)  SELECT `users`.* FROM `users` WHERE `users`.`id` != 1 /* loading for inspect */ LIMIT 11
 => #<ActiveRecord::Relation [#<User id: 2, name: "Mudhol", location: "Bangalore", sem: 4, created_at: "2021-08-07 13:09:34.671943000 +0000", updated_at: "2021-08-07 13:09:34.671943000 +0000">, #<User id: 3, name: "Jk", location: "Hubli", sem: 4, created_at: "2021-08-07 13:09:48.447129000 +0000", updated_at: "2021-08-07 13:09:48.447129000 +0000">, #<User id: 4, name: "Rathod", location: "Hubli", sem: 4, created_at: "2021-08-07 13:09:57.962579000 +0000", updated_at: "2021-08-07 13:09:57.962579000 +0000">, #<User id: 5, name: "Arun", location: "Mysore", sem: 2, created_at: "2021-08-07 13:10:10.780064000 +0000", updated_at: "2021-08-07 13:10:10.780064000 +0000">, #<User id: 6, name: "Arun", location: "Gajendragad", sem: 1, created_at: "2021-08-07 13:10:22.958291000 +0000", updated_at: "2021-08-07 13:10:22.958291000 +0000">, #<User id: 7, name: "Sur", location: "Hosur", sem: 1, created_at: "2021-08-07 13:10:41.604116000 +0000", updated_at: "2021-08-07 13:10:41.604116000 +0000">]> 4 Ordering
 To retrieve records from the database in a specific order, you can use the order method.
 
 4 Ordering
 To retrieve records from the database in a specific order, you can use the order method.
 
 For example, 
#  if you're getting a set of records and want to order them in ascending order by the created_at field in your table:"
 
#  Customer.order(:created_at)
#  # OR
#  Customer.order("created_at")
#  Customer.order(:created_at)
#  # OR
#  Customer.order("created_at")
 
#  Copy
#  You could specify ASC or DESC as well:
 
#  Customer.order(created_at: :desc)
#  # OR
#  Customer.order(created_at: :asc)
#  # OR
#  Customer.order("created_at DESC")
#  # OR
#  Customer.order("created_at ASC")

 Examples:-

 2.6.8 :029 > User.order(created_at: :asc);
  User Load (0.5ms)  SELECT `users`.* FROM `users` /* loading for inspect */ ORDER BY `users`.`created_at` ASC LIMIT 11
 => #<ActiveRecord::Relation [#<User id: 1, name: "Raghavendra Mudhol", location: "Bangalore", sem: 5, created_at: "2021-08-07 13:09:22.855963000 +0000", updated_at: "2021-08-07 13:09:22.855963000 +0000">, #<User id: 2, name: "Mudhol", location: "Bangalore", sem: 4, created_at: "2021-08-07 13:09:34.671943000 +0000", updated_at: "2021-08-07 13:09:34.671943000 +0000">, #<User id: 3, name: "Jk", location: "Hubli", sem: 4, created_at: "2021-08-07 13:09:48.447129000 +0000", updated_at: "2021-08-07 13:09:48.447129000 +0000">, #<User id: 4, name: "Rathod", location: "Hubli", sem: 4, created_at: "2021-08-07 13:09:57.962579000 +0000", updated_at: "2021-08-07 13:09:57.962579000 +0000">, #<User id: 5, name: "Arun", location: "Mysore", sem: 2, created_at: "2021-08-07 13:10:10.780064000 +0000", updated_at: "2021-08-07 13:10:10.780064000 +0000">, #<User id: 6, name: "Arun", location: "Gajendragad", sem: 1, created_at: "2021-08-07 13:10:22.958291000 +0000", updated_at: "2021-08-07 13:10:22.958291000 +0000">, #<User id: 7, name: "Sur", location: "Hosur", sem: 1, created_at: "2021-08-07 13:10:41.604116000 +0000", updated_at: "2021-08-07 13:10:41.604116000 +0000">]> 

 5 Selecting Specific Fields
By default, Model.find selects all the fields from the result set using select *.

To select only a subset of fields from the result set, you can specify the subset via the select method.

For example, to select only isbn and out_of_print columns:

Book.select(:isbn, :out_of_print)
# OR
Book.select("isbn, out_of_print")
Book.select(:isbn, :out_of_print)
# OR
Book.select("isbn, out_of_print")

Copy
The SQL query used by this find call will be somewhat like:

SELECT isbn, out_of_print FROM books

Example:-

2.6.8 :031 > User.select(:name)
  User Load (0.4ms)  SELECT `users`.`name` FROM `users` /* loading for inspect */ LIMIT 11
 => #<ActiveRecord::Relation [#<User id: nil, name: "Raghavendra Mudhol">, #<User id: nil, name: "Mudhol">, #<User id: nil, name: "Jk">, #<User id: nil, name: "Rathod">, #<User id: nil, name: "Arun">, #<User id: nil, name: "Arun">, #<User id: nil, name: "Sur">]> 
2.6.8 :032 > User.select(:name).distinct;
  User Load (0.4ms)  SELECT DISTINCT `users`.`name` FROM `users` /* loading for inspect */ LIMIT 11
 => #<ActiveRecord::Relation [#<User id: nil, name: "Raghavendra Mudhol">, #<User id: nil, name: "Mudhol">, #<User id: nil, name: "Jk">, #<User id: nil, name: "Rathod">, #<User id: nil, name: "Arun">, #<User id: nil, name: "Sur">]> 


 https://guides.rubyonrails.org/active_record_querying.html

 7 Group
To apply a GROUP BY clause to the SQL fired by the finder, you can use the group method.

For example, if you want to find a collection of the dates on which orders were created:

Order.select("created_at").group("created_at")

Example:-

2.6.8 :033 > User.select("name").group("id")
  User Load (0.4ms)  SELECT `users`.`name` FROM `users` GROUP BY `users`.`id` /* loading for inspect */ LIMIT 11
 => #<ActiveRecord::Relation [#<User id: nil, name: "Raghavendra Mudhol">, #<User id: nil, name: "Mudhol">, #<User id: nil, name: "Jk">, #<User id: nil, name: "Rathod">, #<User id: nil, name: "Arun">, #<User id: nil, name: "Arun">, #<User id: nil, name: "Sur">]> 
