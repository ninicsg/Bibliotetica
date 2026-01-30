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
    @genero.destroy
    redirect_to generos_path
  end

  def show
    @genero = Genero.find(params[:id])
    @livros = @genero.livros
  end
end