class Autor < ActiveRecord::Base
    attr_accessible :nome
    self.table_name = 'autores'

end