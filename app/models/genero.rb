class Genero < ActiveRecord::Base
  attr_accessible :nome # IMPORTANTE: Sem isso, o banco não salva o nome vindo do form
  has_many :livros
  validates :nome, presence: true
end