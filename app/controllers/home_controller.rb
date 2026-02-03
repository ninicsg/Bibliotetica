class HomeController < ApplicationController
  before_filter :verifica_login

  def index
    @emprestimos = Emprestimo
      .includes(:livro, :usuario)
      .where(data_devolucao: nil)
      .sort_by { |e| [e.atrasado? ? 0 : 1, e.data_prevista_devolucao] }

    @livros_disponiveis = Livro.where(
      "id NOT IN (
        SELECT livro_id
        FROM emprestimos
        WHERE data_devolucao IS NULL
      )"
    )
  end

  private

  def verifica_login
    redirect_to root_path unless session[:usuario_id]
  end
end