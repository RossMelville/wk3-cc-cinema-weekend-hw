require_relative ("../db/sql_runner.rb")
require_relative ("./film.rb")
require_relative ("./customer.rb")
require ('pry')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES (#{@customer_id}, #{@film_id})
    RETURNING id;"

# response.find {|x| x['label'] == 'cat' }
    
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i

    films = Film.all
    films.find { |film| @id = film_id}
    
    customers = Customer.all
    customers.find { |customer| @id = customer_id}

    for cust in customer do
      cust.funds = (cust.funds - film[0].price)
      cust.update
    end
    
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end

  def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id};"
    films = SqlRunner.run(sql)
    return films.map{ |film| Film.new(film)}
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

  def self.delete
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end


end