class HomeController < ApplicationController
  before_filter :verifica_login

  def index
  end

  private

  def verifica_login
    redirect_to root_path unless session[:usuario_id]
  end
end