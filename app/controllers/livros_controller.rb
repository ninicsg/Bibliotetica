class LivrosController < ApplicationController
  before_filter :verifica_login

def index
  termo = params[:busca]

  if termo.present?
    @livros = Livro.joins(:autor, :genero).where(
      "livros.titulo LIKE ? OR autores.nome = ? OR generos.nome = ?", 
      "%#{termo}%", termo, termo
    )
    
    if @livros.empty?
      @livros = Livro.where("titulo LIKE ?", "%#{termo}%")
    end
  else
    @livros = Livro.all
  end
end

def new
    @livro = Livro.new
    @autores = Autor.order(:nome)
    @generos = Genero.order(:nome)
end

def create
  @livro = Livro.new(params[:livro])
  if @livro.save
    redirect_to livros_path, notice: 'Livro criado com sucesso!'
  else
    @autores = Autor.order(:nome)
    @generos = Genero.order(:nome)
    render :new
  end
end

  def show
    @livro = Livro.find(params[:id])
  end

  def edit
    @livro = Livro.find(params[:id])
    @autores = Autor.all 
    @generos = Genero.all
  end

  def update
    @livro = Livro.find(params[:id])
    if @livro.update_attributes(params[:livro])
      redirect_to livros_path
    else
      @autores = Autor.all
      @generos = Genero.all
      render :edit
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy
    redirect_to livros_path
  end
end