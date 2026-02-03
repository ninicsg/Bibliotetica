class CreateEmprestimos < ActiveRecord::Migration
  def up
    create_table :emprestimos do |t|
      t.integer :usuario_id, null: false
      t.integer :livro_id,   null: false

      t.date :data_emprestimo
      t.date :data_prevista_devolucao
      t.date :data_devolucao

      t.timestamps
    end

    add_index :emprestimos, :usuario_id
    add_index :emprestimos, :livro_id
  end

  def down
    drop_table :emprestimos
  end
end