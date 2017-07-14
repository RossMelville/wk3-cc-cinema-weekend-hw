require_relative ("../db/sql_runner.rb")
require_relative ("./customer.rb")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) 
      VALUES ('#{@title}', #{@price}) 
      RETURNING id;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price)
      = ('#{title}', #{price})
      WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM films;"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

  def self.delete
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end


end