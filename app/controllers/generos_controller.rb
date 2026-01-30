class GenerosController < ApplicationController
  before_filter :verifica_login

  def index
    @generos = Genero.all
  end

  def new
    @genero = Genero.new
  end

  def create
    @genero = Genero.new(params[:genero])
    if @genero.save
      redirect_to generos_path, notice: "Gênero criado com sucesso!"
    else
      render :new
    end
  end

  def edit
    @genero = Genero.find(params[:id])
  end

  def update
    @genero = Genero.find(params[:id])
    if @genero.update_attributes(params[:genero])
      redirect_to generos_path
    else
      render :edit
    end
  end

    def destroy
    @genero = Genero.find(params[:id])
    
    begin
        @genero.destroy
        redirect_to generos_path, notice: 'Gênero excluído com sucesso!'
    rescue ActiveRecord::DeleteRestrictionError
        # Em vez de dar erro 500, capturamos a exceção e avisamos o usuário
        redirect_to generos_path, alert: 'Não é possível excluir: este gênero possui livros cadastrados.'
    end
    end

  def show
    @genero = Genero.find(params[:id])
    @livros = @genero.livros
  end
end