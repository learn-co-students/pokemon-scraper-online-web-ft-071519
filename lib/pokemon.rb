class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(attributes)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type, db)
          VALUES (?, ?, ?)
        SQL
     
        db.execute(sql, name, type, db)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        binding.pry
        # db.execute("SELECT * FROM pokemon WHERE id = '#{id}'")
    end

    # def self.find(id, db)
    #   sql = <<-SQL
    #     SELECT *
    #     FROM pokemon
    #     WHERE id = ?
    #   SQL

    #   pokemon = db.execute(sql, id)[0]
    #   Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2])
    # end

end