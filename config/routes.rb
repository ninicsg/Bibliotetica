Bibliotetica::Application.routes.draw do
  get '/autores', to: 'autores#index', as: :autores
  get '/autores/new', to: 'autores#new', as: :new_autor
  post '/autores', to: 'autores#create', as: :criar_autor
  get '/autores/:id', to: 'autores#show', as: :autor
  get '/autores/:id/edit', to: 'autores#edit', as: :edit_autor
  put '/autores/:id', to: 'autores#update', as: :atualizar_autor
  delete '/autores/:id', to: 'autores#destroy', as: :deletar_autor
end