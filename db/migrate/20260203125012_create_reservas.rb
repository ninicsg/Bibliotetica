class CreateReservas < ActiveRecord::Migration
  def up
    create_table :reservas do |t|
      t.integer :usuario_id, null: false
      t.integer :livro_id,   null: false
      t.integer :posicao

      t.timestamps
    end

    add_index :reservas, :usuario_id
    add_index :reservas, :livro_id
  end

  def down
    drop_table :reservas
  end
end