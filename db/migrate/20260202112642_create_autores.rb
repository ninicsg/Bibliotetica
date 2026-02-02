class CreateAutores < ActiveRecord::Migration
  def up
    create_table :autores do |t|
      t.string :nome
      t.date :data_nasc
      t.date :data_morte
      t.timestamps
    end
  end

  def down
    drop_table :autores
  end
end
