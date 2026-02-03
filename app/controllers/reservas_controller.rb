class ReservasController < ApplicationController
  before_filter :verifica_login

  def create
    livro = Livro.find(params[:livro_id])

    if Reserva.exists?(usuario_id: session[:usuario_id], livro_id: livro.id)
      redirect_to livro_path(livro), alert: "Você já reservou este livro."
      return
    end

    ultima_posicao = livro.reservas.maximum(:posicao) || 0

    Reserva.create!(
      usuario_id: session[:usuario_id],
      livro_id: livro.id,
      posicao: ultima_posicao + 1
    )

    redirect_to livro_path(livro), notice: "Livro reservado! Posição na fila: #{ultima_posicao + 1}"
  end
end
