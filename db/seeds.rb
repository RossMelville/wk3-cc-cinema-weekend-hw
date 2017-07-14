require_relative ("../models/customer.rb")
require_relative ("../models/film.rb")
require_relative ("../models/ticket.rb")

require ("pry")


customer1 = Customer.new({ 'name' => 'Ross', 'funds' => 30 })
customer1.save

film1 = Film.new({ 'title' => 'War for the Planet of the Apes', 'price' => 7 })
film1.save



binding.pry