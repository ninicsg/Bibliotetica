Bibliotetica::Application.routes.draw do
  get "usuarios/new"

  get "usuarios/create"
  get '/usuarios/:id', to: 'usuarios#show', as: :usuario


  root to: 'login#login'
  get  '/usuarios/new', to: 'usuarios#new',    as: :new_usuario
  post '/usuarios',     to: 'usuarios#create', as: :usuarios
  get  '/login',  to: 'login#login',  as: :login
  post '/login',  to: 'login#logar',  as: :logar
  get  '/logout', to: 'login#logout', as: :logout

  get '/home', to: 'home#index', as: :home

  get    '/autores',          to: 'autores#index',   as: :autores
  get    '/autores/new',      to: 'autores#new',     as: :new_autor
  post   '/autores',          to: 'autores#create',  as: :create_autor
  get    '/autores/:id',      to: 'autores#show',    as: :autor
  get    '/autores/:id/edit', to: 'autores#edit',    as: :edit_autor
  put    '/autores/:id',      to: 'autores#update',  as: :update_autor
  delete '/autores/:id',      to: 'autores#destroy', as: :destroy_autor

  get    'generos',            to: 'generos#index',   as: :generos
  get    'generos/novo',       to: 'generos#new',     as: :new_genero
  post   'generos/criar',      to: 'generos#create',  as: :create_genero
  get    'generos/:id',        to: 'generos#show',    as: :genero
  get    'generos/:id/editar', to: 'generos#edit',    as: :edit_genero
  put    'generos/:id',        to: 'generos#update',  as: :update_genero
  delete 'generos/:id',        to: 'generos#destroy', as: :destroy_genero

  get    "livros"          => "livros#index",   as: :livros
  get    "livros/novo"     => "livros#new",    as: :new_livro
  post   "livros/criar"    => "livros#create",   as: :create_livro
  get    "livros/:id"      => "livros#show", as: :livro
  get    "livros/:id/editar" => "livros#edit", as: :edit_livro
  put    "livros/:id"      => "livros#update", as: :update_livro
  delete "livros/:id"      => "livros#destroy", as: :destroy_livro
  post "livros/:id/emprestar" => "livros#emprestar", as: :emprestar_livro
  post "livros/:id/devolver"  => "livros#devolver",  as: :devolver_livro
  post '/livros/:livro_id/emprestar', to: 'emprestimos#create', as: :emprestar_livro
  put  '/emprestimos/:id/devolver',   to: 'emprestimos#devolver', as: :devolver_emprestimo
  post '/livros/:livro_id/reservar', to: 'reservas#create', as: :reservar_livro
  delete '/reservas/:id', to: 'reservas#destroy', as: :cancelar_reserva


end