class Genero < ActiveRecord::Base
  attr_accessible :nome 
  has_many :livros, dependent: :restrict
  validates :nome, presence: true
end