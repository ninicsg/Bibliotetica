class AutoresController < ApplicationController

    def index
        @autores = Autor.all
        # @autores = Autor.order(:id, :nome)
    end

    def show
       #binding.pry
       @autor = Autor.find_by_id(params[:id]) #busca pelo id
       @livros = @autor.livros 
    end

    def new
        @autor = Autor.new
        @autores = Autor.order(:nome)
    end

    def create
        @autor = Autor.new(params[:autor])
        if @autor.save
            redirect_to autores_path
        else
            render 'new'
        end
    end

    def edit
        @autor = Autor.find_by_id(params[:id])
    end

    def update
        @autor = Autor.find_by_id(params[:id])
        if @autor.update_attributes(params[:autor])
            redirect_to @autor
        else
            render 'edit'
        end

    end

    def destroy
    @autor = Autor.find(params[:id])
    
    begin
        @autor.destroy
        flash[:notice] = "Autor excluído com sucesso!"
    rescue ActiveRecord::DeleteRestrictionError #nao deixa excluir se tiver filhos vinculados
        flash[:alert] = "Não é possível excluir este autor pois ele possui livros vinculados."
    end

    redirect_to autores_path
    end

    # def autor_livros
    #     @autor = Autor.find_by_id(params[:id])
    #     @livros = @autor.livros
    # end
end