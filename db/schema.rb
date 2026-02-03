# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20260203125012) do

  create_table "autores", :force => true do |t|
    t.string   "nome"
    t.date     "data_nasc"
    t.date     "data_morte"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emprestimos", :force => true do |t|
    t.integer  "usuario_id",              :null => false
    t.integer  "livro_id",                :null => false
    t.date     "data_emprestimo"
    t.date     "data_prevista_devolucao"
    t.date     "data_devolucao"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "emprestimos", ["livro_id"], :name => "index_emprestimos_on_livro_id"
  add_index "emprestimos", ["usuario_id"], :name => "index_emprestimos_on_usuario_id"

  create_table "generos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "livros", :force => true do |t|
    t.integer  "autor_id",       :null => false
    t.integer  "genero_id"
    t.string   "titulo",         :null => false
    t.integer  "qtd_paginas"
    t.text     "sinopse"
    t.integer  "ano_lancamento"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "livros", ["autor_id"], :name => "index_livros_on_autor_id"
  add_index "livros", ["genero_id"], :name => "index_livros_on_genero_id"

  create_table "reservas", :force => true do |t|
    t.integer  "usuario_id", :null => false
    t.integer  "livro_id",   :null => false
    t.integer  "posicao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reservas", ["livro_id"], :name => "index_reservas_on_livro_id"
  add_index "reservas", ["usuario_id"], :name => "index_reservas_on_usuario_id"

  create_table "usuarios", :force => true do |t|
    t.string   "email"
    t.string   "senha"
    t.string   "username"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
