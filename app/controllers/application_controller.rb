class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :verifica_login #antes d tudo faz isto

  private

  def verifica_login
    return if controller_name == 'login'
    
    if session[:usuario_id].nil? #se o usuario e tal for nulo volta p login caraio
      redirect_to root_path and return
    end
  end

end
