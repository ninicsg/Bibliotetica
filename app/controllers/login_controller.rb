class LoginController < ApplicationController
  skip_before_filter :verifica_login

  def login
  end

  def logar
    login = params[:login]
    senha = params[:senha]

    usuario = Usuario.where(
      "email = ? OR username = ?",
      login, login
    ).first

    if usuario && usuario.senha == params[:senha]
      session[:usuario_id] = usuario.id
      redirect_to home_path and return
    else
      flash[:erro] = "Login ou senha inválidos"
      render :login
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to login_path
  end
end