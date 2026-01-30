class Autor < ActiveRecord::Base
    attr_accessible :nome, :data_nasc, :data_morte
    self.table_name = 'autores'
    validates :nome, :data_nasc, presence: true
    def data_nascimento_formatada
        Time.parse("#{self.data_nasc}").strftime('%d/%m/%Y')
    end
    def data_morte_formatada
        Time.parse("#{self.data_morte}").strftime('%d/%m/%Y')
    end

    has_many :livros, dependent: :restrict

end