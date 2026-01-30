class LoginController < ApplicationController
  skip_before_filter :verifica_login

  def login
  end

  def logar
    usuario = Usuario.where(email: params[:login]).first


    if usuario && usuario.senha == params[:senha]
      session[:usuario_id] = usuario.id
      redirect_to home_path
    else
      flash[:erro] = "Login ou senha inválidos"
      render :login
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to root_path
  end
end