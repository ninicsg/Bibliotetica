class UsuariosController < ApplicationController
  skip_before_filter :verifica_login, only: [:new, :create]

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])

    if @usuario.save
      session[:usuario_id] = @usuario.id
      redirect_to home_path
    else
      render :new
    end
  end

  def show
    if session[:usuario_id].to_i != params[:id].to_i
      redirect_to home_path, alert: "Acesso não autorizado"
      return
    end

    @usuario = Usuario.find(params[:id])

    @emprestimos_ativos = @usuario.emprestimos.where(data_devolucao: nil)
    @emprestimos_atrasados = @emprestimos_ativos.select(&:atrasado?)
    @reservas = @usuario.reservas.includes(:livro)
  end
end
