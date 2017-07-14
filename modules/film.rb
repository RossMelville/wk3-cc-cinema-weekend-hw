require_relative ("../db/sql_runner.rb")
require_relative ("./customer.rb")


class Film

  def inialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

end