class Livro < ActiveRecord::Base
  attr_accessible :titulo, :autor_id, :genero_id, :qtd_paginas, :sinopse, :ano_lancamento

  belongs_to :autor
  belongs_to :genero

  validates :titulo, :autor_id, :genero_id, presence: true
end