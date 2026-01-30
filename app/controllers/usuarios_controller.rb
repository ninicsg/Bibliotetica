class UsuariosController < ApplicationController
  skip_before_filter :verifica_login

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
end