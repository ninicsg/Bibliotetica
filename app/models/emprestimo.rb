class Emprestimo < ActiveRecord::Base
  attr_accessible :usuario_id, :livro_id,
                  :data_emprestimo,
                  :data_prevista_devolucao,
                  :data_devolucao

  belongs_to :usuario
  belongs_to :livro

  validates :usuario_id, :livro_id, presence: true

  validate :livro_disponivel, on: :create
  validate :usuario_nao_tem_emprestimo_ativo, on: :create

  scope :ativos, -> { where(data_devolucao: nil) }

  def ativo?
    data_devolucao.nil?
  end

  def atrasado?
    ativo? && data_prevista_devolucao.present? &&
      data_prevista_devolucao < Date.today
  end

  private

  def livro_disponivel
    if livro && livro.emprestimos.where(data_devolucao: nil).exists?
      errors.add(:livro, "já está emprestado")
    end
  end

  def usuario_nao_tem_emprestimo_ativo
    if Emprestimo.where(
         usuario_id: usuario_id,
         livro_id: livro_id,
         data_devolucao: nil
       ).exists?
      errors.add(:base, "Você já possui este livro emprestado")
    end
  end
end
