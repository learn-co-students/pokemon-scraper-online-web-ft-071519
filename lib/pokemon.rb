require_relative "../bin/environment.rb"

class Pokemon
  
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name:, type:, id:nil, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
  def self.save(name, type,db = @db)
    sql = <<-SQL
      INSERT INTO pokemon (name,type)
      VALUES(?,?)
    SQL
    
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon = Pokemon.new(name: db.execute(sql, id)[0][1],type: db.execute(sql, id)[0][2],id: db.execute(sql, id)[0][0],db: db) 
    
  end
end

