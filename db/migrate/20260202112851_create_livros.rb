class CreateLivros < ActiveRecord::Migration
  def up
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

  def down
    remove_index :livros, :autor_id
    remove_index :livros, :genero_id
    drop_table :livros
  end
end