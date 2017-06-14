require "sqlite3"
require "pry"

 # db = SQLite3::Database.open('pokemon.db')


class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    #pokemon is a hash containing :id, :name, :type
    @name = pokemon
    @type = type
    @db = db
    # binding.pry
  end

  def self.save(name, type, db)
    values = [name, type]
    query = "INSERT INTO pokemon (name, type) values (?, ?)"
    db.execute(query, values)
  end

  def self.find(num, db)
    query = "SELECT * from pokemon where (?) = pokemon.id"

    temp_arr = db.execute(query, num).flatten
    # binding.pry
    # poke_hash = {id: temp_arr[0], name: temp_arr[1], type: temp_arr[2], db: db}

    pokemon = Pokemon.new(temp_arr[1])
    pokemon.id = temp_arr[0]
    pokemon.type = temp_arr[2]
    pokemon
    # Pokemon.new(temp_arr[1], temp_arr[2], db)
    # binding.pry
  end


end
