require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")

require ("pry")

Ticket.delete
Film.delete
Customer.delete

customer1 = Customer.new({ 'name' => 'Ross', 'funds' => 50 })
customer2 = Customer.new({ 'name' => 'Drew', 'funds' => 30 })
customer3 = Customer.new({ 'name' => 'Niall', 'funds' => 20 })
customer4 = Customer.new({ 'name' => 'Steve', 'funds' => 40 })
customer5 = Customer.new({ 'name' => 'Chris', 'funds' => 60 })

customer1.save
customer2.save
customer3.save
customer4.save
customer5.save

film1 = Film.new({ 'title' => 'War for the Planet of the Apes', 'price' => 7 })
film2 = Film.new({ 'title' => 'Spiderman: Homecoming', 'price' => 7})
film3 = Film.new({ 'title' => 'Despicable Me 3', 'price' => 7})
film4 = Film.new({ 'title' => 'Cars 3', 'price' => 7})
film5 = Film.new({ 'title' => 'Baby Driver', 'price' => 7})

film1.save
film2.save
film3.save
film4.save
film5.save

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket2 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film5.id })
ticket3 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film3.id })
ticket4 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film1.id })
ticket5 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film1.id })
ticket6 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film2.id })
ticket7 = Ticket.new({ 'customer_id' => customer5.id, 'film_id' => film4.id })
ticket8 = Ticket.new({ 'customer_id' => customer3.id, 'film_id' => film3.id })
ticket9 = Ticket.new({ 'customer_id' => customer4.id, 'film_id' => film4.id })
ticket10 = Ticket.new({ 'customer_id' => customer5.id, 'film_id' => film5.id })

ticket1.save
ticket2.save
ticket3.save
ticket4.save
ticket5.save
ticket6.save
ticket7.save
ticket8.save
ticket9.save
ticket10.save





binding.pry

nil