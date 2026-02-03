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

    if @livro.destroy
      redirect_to livros_path, notice: "Livro removido com sucesso"
    else
      redirect_to livros_path, alert: @livro.errors.full_messages.first
    end
  end

  def emprestar
    livro = Livro.find(params[:id])

    if livro.emprestado?
      ultima_posicao = livro.reservas.maximum(:posicao) || 0

      reserva = Reserva.new(
        usuario_id: session[:usuario_id],
        livro_id: livro.id,
        posicao: ultima_posicao + 1
      )

      if reserva.save
        redirect_to livro, notice: "Livro indisponível. Você entrou na fila de reservas."
      else
        redirect_to livro, alert: reserva.errors.full_messages.first
      end
    else
      Emprestimo.create!(
        usuario_id: session[:usuario_id],
        livro_id: livro.id,
        data_emprestimo: Date.today,
        data_prevista_devolucao: Date.today + 7.days
      )

      redirect_to livro, notice: "Livro emprestado com sucesso!"
    end
end

    def devolver
      livro = Livro.find(params[:id])
      emprestimo = livro.emprestimos.where(data_devolucao: nil).first

      if emprestimo
        emprestimo.update_attribute(:data_devolucao, Date.today)

        reserva = livro.reservas.order(:posicao).first

        if reserva
          Emprestimo.create!(
            usuario_id: reserva.usuario_id,
            livro_id: livro.id,
            data_emprestimo: Date.today,
            data_prevista_devolucao: Date.today + 7.days
          )

          reserva.destroy
        end
      end

      redirect_to livro, notice: "Livro devolvido com sucesso!"
    end
end