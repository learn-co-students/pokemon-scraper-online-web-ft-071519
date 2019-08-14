require 'pry'
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
          SQL
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
          SELECT *
          FROM pokemon
          WHERE id = id
          SQL
   info = db.execute(sql)
   new_id = info[0][0]
   new_name = info[0][1]
   new_type = info[0][2]
   self.new(id: new_id, name: new_name, type: new_type, db: db)
    
  end



end
