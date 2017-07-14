require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")

require ("pry")


customer1 = Customer.new({ 'name' => 'Ross', 'funds' => 30 })
customer1.save

film1 = Film.new({ 'title' => 'War for the Planet of the Apes', 'price' => 7 })
film1.save

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket1.save

film1.price = 8
film1.update()

customer1.funds = 22
customer1.update()


binding.pry

nil