require_relative ("../db/sql_runner.rb")
require_relative ("./film.rb")
require_relative ("./customer.rb")

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

    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tickets;"
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end



end