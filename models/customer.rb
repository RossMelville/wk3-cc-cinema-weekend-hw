require_relative ("../db/sql_runner.rb")
require_relative ("./film.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) 
      VALUES ('#{@name}', #{@funds})
      RETURNING id;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds)
      = ('#{@name}', #{@funds})
      WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def films
    sql = "SELECT films.* FROM films
      INNER JOIN tickets ON tickets.film_id = films.id
      WHERE customer_id = #{@id};"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film)}
  end

  def tickets
    sql = "SELECT tickets.* FROM tickets
      WHERE tickets.customer_id = #{@id}"
    tickets = SqlRunner.run(sql)
    return tickets.count
  end

  def self.all
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

  def self.delete
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end


end