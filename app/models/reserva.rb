class Reserva < ActiveRecord::Base
  attr_accessible :usuario_id, :livro_id, :posicao, :data_expiracao

  belongs_to :usuario
  belongs_to :livro

  validates :usuario_id, :livro_id, presence: true
  validate :usuario_pode_reservar, on: :create

  before_create :definir_data_expiracao

  private

  def usuario_pode_reservar
    if Reserva.exists?(usuario_id: usuario_id, livro_id: livro_id)
      errors.add(:base, "Você já está na fila de reservas")
    end

    if Emprestimo.exists?(
         usuario_id: usuario_id,
         livro_id: livro_id,
         data_devolucao: nil
       )
      errors.add(:base, "Você já está com este livro emprestado")
    end
  end

  def definir_data_expiracao
    self.data_expiracao = Date.today + 7.days
  end
end
