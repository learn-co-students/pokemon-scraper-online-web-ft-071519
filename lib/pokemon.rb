class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql= "INSERT INTO pokemon(name, type) VALUES(?, ?)"   
        
        db.execute(sql, name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM Pokemon")[0][0]
    end

    def self.find(id, db)
        # @pokemon = Pokemon.find(id:)
        sql= "SELECT * FROM pokemon WHERE ID = ?"

        info = db.execute(sql, id)
        Pokemon.new(id: info[0][0], name: info[0][1], type: info[0][2], db: db)
    end
end
