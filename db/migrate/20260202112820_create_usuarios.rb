class CreateUsuarios < ActiveRecord::Migration
  def up
    create_table :usuarios do |t|
      t.string :email
      t.string :senha
      t.string :username
      t.timestamps
    end
  end

  def down
    drop_table :usuarios
  end
end