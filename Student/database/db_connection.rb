require 'pg'

class DB_connection

    def initialize(db_config)
        self.connection = PG.connect(db_config)
    end

    def query(query, params=[])
        self.connection.exec_params(query, params)
    end

    def close
        self.connection.close
    end

    private
    attr_accessor :connection
end