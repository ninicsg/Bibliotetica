class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :verifica_login

  private

  def verifica_login
    return if controller_name == 'login'
    
    if session[:usuario_id].nil?
      redirect_to root_path and return
    end
  end

end
