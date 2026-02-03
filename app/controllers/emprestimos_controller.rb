class EmprestimosController < ApplicationController
  before_filter :verifica_login #verifica se existe se nao exisytir manda p login

  def create
    livro = Livro.find(params[:livro_id])

    if !livro.emprestimos.where(data_devolucao: nil).exists?
      Emprestimo.create!(
        usuario_id: session[:usuario_id],
        livro_id: livro.id,
        data_emprestimo: Date.today,
        data_prevista_devolucao: Date.today + 7.days
      )

      redirect_to livro_path(livro), notice: "Livro emprestado com sucesso"
    else
      redirect_to livro_path(livro), alert: "Livro já emprestado. Entre na fila de reservas."
    end
  end

  def devolver
    emprestimo = Emprestimo.find(params[:id])
    emprestimo.update_attribute(:data_devolucao, Date.today) #update atribvutes ignora as validações por eqto

    redirect_to usuario_path(session[:usuario_id]), notice: "Livro devolvido com sucesso"
  end
end