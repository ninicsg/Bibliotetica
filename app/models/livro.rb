class Livro < ActiveRecord::Base
  attr_accessible :titulo, :autor_id, :genero_id, :qtd_paginas, :sinopse, :ano_lancamento

  belongs_to :autor
  belongs_to :genero

  validates :titulo, :autor_id, :genero_id, presence: true
  validates :qtd_paginas, numericality: { only_integer: true, greater_than: 0 }

  validate :ano_lancamento_valido

  has_many :emprestimos
  has_many :reservas

  before_destroy :verificar_dependencias





  def emprestado?
    emprestimos.where(data_devolucao: nil).exists?
  end

  def emprestimo_atual
    emprestimos.where(data_devolucao: nil).first
  end

  private

  def nao_apagar_se_emprestado
  if emprestimos.where(data_devolucao: nil).exists?
    errors.add(:base, "Não é possível apagar um livro que está emprestado")
    return false
  end
end

  def ano_lancamento_valido
    return if ano_lancamento.blank? || autor.blank?

    ano = ano_lancamento.to_i
    ano_atual = Time.now.year

    if autor.data_nasc.present? && ano < autor.data_nasc.year
      errors.add(:ano_lancamento, "não pode ser anterior ao nascimento do autor")
    end

    if autor.data_morte.present? && ano > autor.data_morte.year
      errors.add(:ano_lancamento, "não pode ser posterior à morte do autor")
    end

    if ano > ano_atual
      errors.add(:ano_lancamento, "não pode ser maior que o ano atual")
    end
  end
  
  def verificar_dependencias
    if emprestimos.where(data_devolucao: nil).exists? || reservas.exists?
      errors.add(:base, "Não é possível excluir um livro com empréstimos ou reservas")
      return false
    end
  end
end
