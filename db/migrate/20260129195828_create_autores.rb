class CreateAutores < ActiveRecord::Migration
  def change
    create_table :autores do |t|
      t.string :nome
      t.date :data_nasc
      t.date :data_morte
      t.timestamps
    end
  end
end