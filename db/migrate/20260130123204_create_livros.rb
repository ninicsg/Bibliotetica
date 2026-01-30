class CreateLivros < ActiveRecord::Migration
  def change
    create_table :livros do |t|
      t.integer :autor_id, null: false
      t.integer :genero_id
      t.string :titulo, null: false
      t.integer :qtd_paginas
      t.text :sinopse
      t.integer :ano_lancamento

      t.timestamps
    end

    add_index :livros, :autor_id
    add_index :livros, :genero_id
  end
end
