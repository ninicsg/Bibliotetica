class AddDataExpiracaoToReservas < ActiveRecord::Migration
  def change
    add_column :reservas, :data_expiracao, :date
  end
end
